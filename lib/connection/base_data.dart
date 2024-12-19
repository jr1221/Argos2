import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:argos2/connection/server_data.pb.dart';
import 'package:argos2/global_settings.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

part 'base_data.g.dart';

/// A class for capturing and processing each point coming from a specific topic
class NetFieldCapture<T> {
  /// the stream of data coming from the netfield
  final StreamController<T> _stream = StreamController.broadcast();

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
  addValue(T value) {
    _stream.add(value);
    last = value;
    stale = false;
  }

  /// fetches the underlying stream for use in streambuilders
  Stream<T> getStream() => _stream.stream;

  @override
  String toString() {
    return 'Topic: $topic, Last Value: $last $unit - Stale: $stale';
  }
}

@riverpod
class CapModel extends _$CapModel {
  @override
  Stream<Map<String, NetFieldCapture<List<double>>>> build() async* {
    final con = ref.watch(connectionControlProvider);

    late MqttServerClient client;

    final SplayTreeMap<String, NetFieldCapture<List<double>>> cap =
        SplayTreeMap();

    StreamController<Map<String, NetFieldCapture<List<double>>>>
        streamController = StreamController();
    print('triggered');

    if (con.useMqtt) {
      client = MqttServerClient.withPort(
          con.uri.host,
          'Argos2Client-${DateTime.now().millisecondsSinceEpoch}',
          con.uri.port);
      print(con.uri.port);
      //client.logging(on: true);
      client.keepAlivePeriod = 5;
      client.autoReconnect = true;
      client.resubscribeOnAutoReconnect = true;
      final conn = MqttConnectMessage().startClean();
      client.connectionMessage = conn;

      try {
        print(client.port);
        await client.connect();
      } on Exception catch (e) {
        print('EXAMPLE::client exception - $e');
        client.disconnect();
      }

      client.subscribe('#', MqttQos.atMostOnce);
      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final recMess = c[0].payload as MqttPublishMessage;
        final payload = ServerData.fromBuffer(recMess.payload.message!);
        //print(payload);
        // do special case if its the first time this value has been seen
        if (!cap.containsKey(c[0].topic)) {
          cap[c[0].topic!] = NetFieldCapture(c[0].topic!, payload.unit);
          cap[c[0].topic!]?.addValue(payload.values);
          streamController.add(cap);
          // we must rebuild the whole UI on a new topic
        } else {
          cap[c[0].topic!]?.addValue(payload.values);
        }
      });

      yield* streamController.stream;
    } else {
      io.Socket socket = io.io(con.uri.toString(),
          io.OptionBuilder().setTransports(['websocket']).build());
      print('Connecting to ${con.uri}');
      socket.onConnect((_) {
        print('Connected to socket!');
      });

      //When an event received from server, data is added to the stream
      socket.on('message', (data) {
        final decodedVal = ClientData.fromJson(jsonDecode(data));
        // do special case if its the first time this value has been seen
        if (!cap.containsKey(decodedVal.name)) {
          cap[decodedVal.name] =
              NetFieldCapture(decodedVal.name, decodedVal.unit);
          cap[decodedVal.name]?.addValue(decodedVal.values);
          streamController.add(cap);
          // we must rebuild the whole UI on a new topic
        } else {
          cap[decodedVal.name]?.addValue(decodedVal.values);
        }
      });
      socket.onDisconnect((_) => print('disconnect'));

      yield* streamController.stream;
    }
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

  ClientData.fromJson(Map<String, dynamic> json)
      : runId = json['runId'] as int,
        name = json['name'] as String,
        unit = json['unit'] as String,
        values = (json['values'] as List<dynamic>).cast<double>(),
        timestamp = json['timestamp'] as int;
}
