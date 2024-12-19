import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../global_settings.dart';

part 'run_service.g.dart';

/// A run, as given from Scylla
class PublicRun {
  final int id;
  final String locationName;
  final String driverName;
  final int time;
  final String notes;

  PublicRun(this.id, this.locationName, this.driverName, this.time, this.notes);

  PublicRun.fromJson(final Map<String, dynamic> json)
      : id = json['id'] as int,
        locationName = json['locationName'] as String,
        driverName = json['driverName'] as String,
        time = json['time'] as int,
        notes = json['notes'] as String;
}

/// handle the /runs endpoint
@riverpod
class RunHandler extends _$RunHandler {
  @override
  Future<List<PublicRun>> build() async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    final http.Response response = await http.get(Uri.parse('$conn/runs'));
    final Iterable<dynamic> json = jsonDecode(response.body);
    return List<PublicRun>.from(
      json.map((final dynamic item) => PublicRun.fromJson(item)),
    );
  }

  /// increment the run ID
  Future<PublicRun> incrementRun() async {
    final Uri conn = ref.read(connectionControlProvider).socketUri;
    final http.Response response = await http.post(Uri.parse('$conn/runs/new'));
    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;
    ref.invalidateSelf();
    return PublicRun.fromJson(json);
  }
}
