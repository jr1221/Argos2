import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../global_settings.dart';
import 'server_data.pb.dart';

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
}

@riverpod
Stream<Map<String, NetFieldCapture<List<double>>>> capModelHolder(
  final Ref ref,
) async* {
  final Uri conUri = ref.watch(
    connectionControlProvider.select((final ConnectionProps it) => it.uri),
  );
  final bool useMqtt = ref.watch(
    connectionControlProvider.select((final ConnectionProps it) => it.useMqtt),
  );

  MqttServerClient? client;
  io.Socket? socket;
  final SplayTreeMap<String, NetFieldCapture<List<double>>> cap =
      SplayTreeMap<String, NetFieldCapture<List<double>>>();
  // cleanup the netfield caps
  ref.onDispose(() async {
    for (final NetFieldCapture<List<double>> entry in cap.values) {
      await entry.dispose();
    }
    print('destroying cap');
    cap.clear();
  });

  final StreamController<Map<String, NetFieldCapture<List<double>>>>
      streamController =
      StreamController<Map<String, NetFieldCapture<List<double>>>>();
  ref.onDispose(streamController.close);

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
        cap[c[0].topic!] =
            NetFieldCapture<List<double>>(c[0].topic!, payload.unit);
        cap[c[0].topic!]?.addValue(payload.values);
        streamController.add(cap);
        // we must rebuild the whole UI on a new topic
      } else {
        cap[c[0].topic!]?.addValue(payload.values);
      }
    });

    yield* streamController.stream;
  } else {
    socket = io.io(
      conUri.toString(),
      io.OptionBuilder().setTransports(<String>['websocket']).build(),
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
      ..on('message', (final dynamic data) {
        final ClientData decodedVal = ClientData.fromJson(jsonDecode(data));
        // do special case if its the first time this value has been seen
        if (!cap.containsKey(decodedVal.name)) {
          cap[decodedVal.name] =
              NetFieldCapture<List<double>>(decodedVal.name, decodedVal.unit);
          cap[decodedVal.name]?.addValue(decodedVal.values);
          streamController.add(cap);
          // we must rebuild the whole UI on a new topic
        } else {
          cap[decodedVal.name]?.addValue(decodedVal.values);
        }
      })
      ..onDisconnect((final _) => print('disconnect'));

    yield* streamController.stream;
  }
}

/// Socket wire format, JSON
class ClientData {
  final int runId;
  final String name;
  final String unit;
  final List<double> values;
  final int timestamp;

  ClientData(this.runId, this.name, this.unit, this.values, this.timestamp);

  ClientData.fromJson(final Map<String, dynamic> json)
      : runId = json['runId'] as int,
        name = json['name'] as String,
        unit = json['unit'] as String,
        values = (json['values'] as List<dynamic>).cast<double>(),
        timestamp = json['timestamp'] as int;
}
