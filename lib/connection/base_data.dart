import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../global_settings.dart';
import '../services/datatype_service.dart';
import '../services/rule_service.dart';
import 'server_data.pb.dart';

part 'base_data.freezed.dart';
part 'base_data.g.dart';

/// A class for capturing and processing each point coming from a specific topic
class NetFieldCapture<T> {
  /// the stream of data coming from the netfield
  final StreamController<T> _stream = StreamController<T>.broadcast();

  /// the topic of the netfield
  final String topic;

  /// the unit of the netfield
  final String unit;

  /// the latest value placed in the stream
  T? last;

  /// whether the item is stale (only checked upon initially listening)
  bool stale = false;

  NetFieldCapture(this.topic, this.unit) {
    // when listening is established, mark stale (so un-stale can happen)
    // add the last item to the stream in case the source is stale
    _stream.onListen = () {
      stale = true;
      if (last != null) {
        _stream.add(last as T);
      }
    };
  }

  /// adds a value to the stream
  void addValue(final T value) {
    _stream.add(value);
    last = value;
    stale = false;
  }

  /// fetches the underlying stream for use in streambuilders
  Stream<T> getStream() => _stream.stream;

  @override
  String toString() => 'Topic: $topic, Last Value: $last $unit - Stale: $stale';

  Future<void> dispose() async {
    await _stream.close();
  }

  PublicDataType get publicDataType => PublicDataType(name: topic, unit: unit);
}

@riverpod
Stream<Map<String, NetFieldCapture<(List<double>, DateTime)>>> capModelHolder(
  final Ref ref,
) async* {
  final Uri conUri = ref.watch(
    connectionControlProvider.select((final ConnectionProps it) => it.uri),
  );
  final bool useMqtt = ref.watch(
    connectionControlProvider.select((final ConnectionProps it) => it.useMqtt),
  );

  final String rulesClientId = ref.watch(ruleClientIdProvider).value ?? '';

  MqttServerClient? client;
  io.Socket? socket;
  final SplayTreeMap<String, NetFieldCapture<(List<double>, DateTime)>> cap =
      SplayTreeMap<String, NetFieldCapture<(List<double>, DateTime)>>();
  // cleanup the netfield caps
  ref.onDispose(() async {
    for (final NetFieldCapture<(List<double>, DateTime)> entry in cap.values) {
      await entry.dispose();
    }
    print('destroying cap');
    cap.clear();
  });

  final StreamController<Map<String, NetFieldCapture<(List<double>, DateTime)>>>
      streamController = StreamController<
          Map<String, NetFieldCapture<(List<double>, DateTime)>>>();
  ref.onDispose(streamController.close);

  // a hook to populate the netfield caps with dataTypes that should exist
  // good for not live viewing
  if (!useMqtt) {
    ref.listen(getDataTypesProvider, (
      final AsyncValue<List<PublicDataType>>? prev,
      final AsyncValue<List<PublicDataType>> newDataTypes,
    ) {
      if (newDataTypes.valueOrNull != null) {
        for (final PublicDataType type in newDataTypes.valueOrNull!) {
          if (!cap.containsKey(type.name)) {
            cap[type.name] = NetFieldCapture<(List<double>, DateTime)>(
              type.name,
              type.unit,
            );
            streamController.add(cap);
          }
        }
      }
    });
  }

  if (useMqtt) {
    client = MqttServerClient.withPort(
      conUri.host,
      'Argos2Client-${DateTime.now().millisecondsSinceEpoch}',
      conUri.port,
    );
    ref.onDispose(() {
      client?.disconnect();
      client = null;
    });
    //client.logging(on: true);
    client!.keepAlivePeriod = 5;
    client!.autoReconnect = true;
    client!.resubscribeOnAutoReconnect = true;
    final MqttConnectMessage conn = MqttConnectMessage().startClean();
    client!.connectionMessage = conn;

    await client!.connect();

    client!.subscribe('#', MqttQos.atMostOnce);
    client!.updates.listen((final List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final ServerData payload =
          ServerData.fromBuffer(recMess.payload.message!);
      // do special case if its the first time this value has been seen
      if (!cap.containsKey(c[0].topic)) {
        cap[c[0].topic!] = NetFieldCapture<(List<double>, DateTime)>(
          c[0].topic!,
          payload.unit,
        );
        cap[c[0].topic!]?.addValue(
          (
            payload.values,
            DateTime.fromMicrosecondsSinceEpoch(payload.timeUs.toInt())
          ),
        );
        streamController.add(cap);
        // we must rebuild the whole UI on a new topic
      } else {
        cap[c[0].topic!]?.addValue(
          (
            payload.values,
            DateTime.fromMicrosecondsSinceEpoch(payload.timeUs.toInt())
          ),
        );
      }
    });

    yield* streamController.stream;
  } else {
    print('CLIENT ID $rulesClientId');
    socket = io.io(
      conUri.toString(),
      io.OptionBuilder().setTransports(<String>['websocket']).setExtraHeaders(
          <String, dynamic>{'NERAuthorization': rulesClientId},).build(),
    );
    ref.onDispose(() {
      socket?.disconnect();
      socket?.dispose();
    });
    print('Connecting to $conUri');
    socket
      ..onConnect((final _) {
        print('Connected to socket!');
      })
      //When an event received from server, data is added to the stream
      ..on('data', (final dynamic data) {
        final ClientData decodedVal = ClientData.fromJson(jsonDecode(data));
        // do special case if its the first time this value has been seen
        if (!cap.containsKey(decodedVal.name)) {
          cap[decodedVal.name] = NetFieldCapture<(List<double>, DateTime)>(
            decodedVal.name,
            decodedVal.unit,
          );
          cap[decodedVal.name]?.addValue(
            (
              decodedVal.values,
              DateTime.fromMillisecondsSinceEpoch(decodedVal.timestamp)
            ),
          );
          streamController.add(cap);
          // we must rebuild the whole UI on a new topic
        } else {
          cap[decodedVal.name]?.addValue(
            (
              decodedVal.values,
              DateTime.fromMillisecondsSinceEpoch(decodedVal.timestamp)
            ),
          );
        }
      })
      ..on('metadata', (final dynamic data) {
        final ClientData decodedVal = ClientData.fromJson(jsonDecode(data));
        // do special case if its the first time this value has been seen
        if (!cap.containsKey(decodedVal.name)) {
          cap[decodedVal.name] = NetFieldCapture<(List<double>, DateTime)>(
            decodedVal.name,
            decodedVal.unit,
          );
          cap[decodedVal.name]?.addValue(
            (
              decodedVal.values,
              DateTime.fromMillisecondsSinceEpoch(decodedVal.timestamp)
            ),
          );
          streamController.add(cap);
          // we must rebuild the whole UI on a new topic
        } else {
          cap[decodedVal.name]?.addValue(
            (
              decodedVal.values,
              DateTime.fromMillisecondsSinceEpoch(decodedVal.timestamp)
            ),
          );
        }
      })
      ..on('rule_notify', (final dynamic data) {
        ref
            .read(ruleNotificationsManagerProvider.notifier)
            .addNotification(RuleNotification.fromJson(data));
      })
      ..onDisconnect((final _) => print('disconnect'));

    yield* streamController.stream;
  }
}

/// Socket wire format, JSON
@freezed
abstract class ClientData with _$ClientData {
  const factory ClientData({
    required final int runId,
    required final String name,
    required final String unit,
    required final List<double> values,
    required final int timestamp,
  }) = _ClientData;

  factory ClientData.fromJson(final Map<String, Object?> json) =>
      _$ClientDataFromJson(json);
}
