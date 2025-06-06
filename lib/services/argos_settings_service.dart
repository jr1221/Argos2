import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../global_settings.dart';

part 'argos_settings_service.freezed.dart';
part 'argos_settings_service.g.dart';

@riverpod
Future<ScyllaSettings> getSettings(final Ref ref) async {
  final Uri conn = ref.watch(connectionControlProvider).socketUri;
  final http.Response response =
      await http.get(Uri.parse('$conn/scylla/get_settings'));
  final Map<String, dynamic> json =
      jsonDecode(response.body) as Map<String, dynamic>;
  return ScyllaSettings.fromJson(json);
}

@riverpod
class DataUploadDisable extends _$DataUploadDisable {
  @override
  Future<bool> build() => ref.watch(
        getSettingsProvider.selectAsync(
          (final ScyllaSettings data) => data.data_upload_disabled,
        ),
      );

  Future<void> setDataUploadDisable() async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    await http.put(Uri.parse('$conn/scylla/upload/disable'));
    ref.invalidate(getSettingsProvider);
  }

  Future<void> unsetDataUploadDisable() async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    await http.put(Uri.parse('$conn/scylla/upload/enable'));
    ref.invalidate(getSettingsProvider);
  }
}

@riverpod
class BatchUpsertTime extends _$BatchUpsertTime {
  @override
  Future<int> build() => ref.watch(
        getSettingsProvider
            .selectAsync((final ScyllaSettings data) => data.batch_upsert_time),
      );

  Future<void> setBatchUpsertTime(final int time) async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    await http.put(Uri.parse('$conn/scylla/batch_time/$time'));
    ref.invalidate(getSettingsProvider);
  }
}

enum RateLimitMode {
  Static,
  None,
}

@riverpod
class RateLimitModeSelect extends _$RateLimitModeSelect {
  @override
  Future<RateLimitMode> build() => ref.watch(
        getSettingsProvider.selectAsync(
          (final ScyllaSettings data) =>
              RateLimitMode.values[data.ratelimit_mode],
        ),
      );

  Future<void> setRatelimitMode(final RateLimitMode mode) async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    await http.put(Uri.parse('$conn/scylla/ratelimit_mode/${mode.index}'));
    ref.invalidate(getSettingsProvider);
  }
}

@riverpod
class StaticRatelimitTime extends _$StaticRatelimitTime {
  @override
  Future<int> build() => ref.watch(
        getSettingsProvider.selectAsync(
          (final ScyllaSettings data) => data.static_ratelimit_time,
        ),
      );

  Future<void> setStaticRatelimitTime(final int time) async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    await http.put(Uri.parse('$conn/scylla/static_ratelimit_time/$time'));
    ref.invalidate(getSettingsProvider);
  }
}

@riverpod
class SocketDiscardPercent extends _$SocketDiscardPercent {
  @override
  Future<int> build() => ref.watch(
        getSettingsProvider.selectAsync(
          (final ScyllaSettings data) => data.socket_discard_percent,
        ),
      );

  Future<void> setSocketDiscardPercent(final int time) async {
    final Uri conn = ref.watch(connectionControlProvider).socketUri;
    await http.put(Uri.parse('$conn/scylla/socket_discard_percent/$time'));
    ref.invalidate(getSettingsProvider);
  }
}

/// All of scylla's settings
@freezed
abstract class ScyllaSettings with _$ScyllaSettings {
  const factory ScyllaSettings({
    required final bool data_upload_disabled,
    required final int batch_upsert_time,
    required final int ratelimit_mode,
    required final int static_ratelimit_time,
    required final int socket_discard_percent,
  }) = _ScyllaSettings;

  factory ScyllaSettings.fromJson(final Map<String, Object?> json) =>
      _$ScyllaSettingsFromJson(json);
}
