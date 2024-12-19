import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../shared_preferences.dart';

part 'run_service.g.dart';

class PublicRun {
  final int id;
  final String locationName;
  final String driverName;
  final int time;
  final String notes;

  PublicRun(this.id, this.locationName, this.driverName, this.time, this.notes);

  PublicRun.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        locationName = json['locationName'] as String,
        driverName = json['driverName'] as String,
        time = json['time'] as int,
        notes = json['notes'] as String;
}

@riverpod
class RunHandler extends _$RunHandler {
  @override
  Future<List<PublicRun>> build() async {
    final baseUri = await SharedPreferencesClass.restore(BACKEND_URI_KEY);
    final response = await http.get(Uri.parse('$baseUri/runs'));
    final Iterable json = jsonDecode(response.body);
    return List<PublicRun>.from(json.map((model) => PublicRun.fromJson(model)));
  }

  Future<PublicRun> incrementRun() async {
    final baseUri = await SharedPreferencesClass.restore(BACKEND_URI_KEY);
    final response = await http.post(Uri.parse('$baseUri/runs/new'));
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    ref.invalidateSelf();
    return PublicRun.fromJson(json);
  }
}
