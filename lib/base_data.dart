import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

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
  _addValue(T value) {
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

/// a model to capture data from the socket and manage a bunch of streams,
/// 1 per topic
class CapModel extends ChangeNotifier {
  /// a map corresponding topic --> NetFieldCapture
  final SplayTreeMap<String, NetFieldCapture<List<double>>> _cap =
      SplayTreeMap();

  /// get a specifc capture object given a topic
  NetFieldCapture<List<double>>? getCapture(String topic) {
    return _cap[topic];
  }

  /// get all of the capture objects for displaying every datapoint
  List<NetFieldCapture<List<double>>> getCaps() {
    return _cap.values.toList();
  }

  CapModel(dynamic uri) {
    // establish a connection
    io.Socket socket = io.io(uri,
        io.OptionBuilder().setTransports(['websocket']).build());
    print('Connecting to $uri');
    socket.onConnect((_) {
      print('Connected to socket!');
    });

    //When an event received from server, data is added to the stream
    socket.on('message', (data) {
      final decodedVal = ClientData.fromJson(jsonDecode(data));
      // do special case if its the first time this value has been seen
      if (!_cap.containsKey(decodedVal.name)) {
        _cap[decodedVal.name] = NetFieldCapture(decodedVal.name, decodedVal.unit);
        _cap[decodedVal.name]?._addValue(decodedVal.values);
        // we must rebuild the whole UI on a new topic
        notifyListeners();
      } else {
        _cap[decodedVal.name]?._addValue(decodedVal.values);
      }
    });
    socket.onDisconnect((_) => print('disconnect'));
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
