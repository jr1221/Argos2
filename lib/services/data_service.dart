import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../global_settings.dart';

part 'data_service.g.dart';

@riverpod
Future<List<PublicData>> getDataWithRunId(
  final Ref ref, {
  required final String topic,
  required final int runId,
}) async {
  final Uri conn = ref.watch(connectionControlProvider).socketUri;
  final http.Response response = await http
      .get(Uri.parse('$conn/data/${Uri.encodeComponent(topic)}/$runId'));
  final Iterable<dynamic> json = jsonDecode(response.body);
  return List<PublicData>.from(
    json.map((final dynamic item) => PublicData.fromJson(item)),
  );
}

@riverpod
Future<List<List<PublicData>>> getMultiDataWithRunId(
    final Ref ref, {
      required final List<String> topics,
      required final int runId,
    }) async {
  final Uri conn = ref.watch(connectionControlProvider).socketUri;
  final List<List<PublicData>> data = <List<PublicData>>[];
  for (final String topic in topics) {
    final http.Response response = await http
        .get(Uri.parse('$conn/data/${Uri.encodeComponent(topic)}/$runId'));
    final Iterable<dynamic> json = jsonDecode(response.body);
    data.add(List<PublicData>.from(
      json.map((final dynamic item) => PublicData.fromJson(item)),
    ),);
  }
  return data;
}

class PublicData {
  final List<double> values;
  final int time;

  PublicData(this.values, this.time);

  PublicData.fromJson(final Map<String, dynamic> json)
      : values = (json['values'] as List<dynamic>).cast<double>(),
        time = json['time'] as int;
}
