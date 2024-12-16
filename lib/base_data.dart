import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class StreamCap {
  final StreamController<double> _streamAdd = StreamController.broadcast();
  final String topic;
  final String unit;
  double? last;
  bool stale = false;

  StreamCap(this.topic, this.unit) {
    cacheCallback() {
      stale = true;
      _streamAdd.add(last ?? -1);
    }

    _streamAdd.onListen = cacheCallback;
  }

  addValue(value) {
    _streamAdd.add(value);
    last = value;
    stale = false;
  }

  Stream<double> getStream() => _streamAdd.stream;

  @override
  String toString() {
    return 'Topic: $topic, Last Value: $last $unit';
  }
}

class CapModel extends ChangeNotifier {
  final SplayTreeMap<String, StreamCap> cap = SplayTreeMap();

  StreamCap? getCap(String topic) {
    return cap[topic];
  }

  List<StreamCap> getCaps() {
    return cap.values.toList();
  }

  CapModel() {
    io.Socket socket = io.io('http://192.168.0.82:8000',
        io.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('Connected to socket!');
      socket.emit('msg', 'test');
    });

    //When an event received from server, data is added to the stream
    socket.on('message', (data) {
      final val = ClientData.fromJson(jsonDecode(data));
      if (!cap.containsKey(val.name)) {
        cap[val.name] = StreamCap(val.name, val.unit);
        cap[val.name]?.addValue(val.values.first);
        notifyListeners();
      } else {
        cap[val.name]?.addValue(val.values.first);
      }
    });
    socket.onDisconnect((_) => print('disconnect'));
  }
}

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
