import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../global_settings.dart';

part 'dashboard_service.g.dart';
part 'dashboard_service.freezed.dart';

@freezed
class DashboardConfig with _$DashboardConfig {
  const factory DashboardConfig({
    required final List<String> data,
    required final int crossAxisCount,
  }) = _DashboardConfig;

  factory DashboardConfig.fromJson(final Map<String, Object?> json) =>
      _$DashboardConfigFromJson(json);
}

@riverpod
class AvailableDashboardsManager extends _$AvailableDashboardsManager {
  SplayTreeSet<String> _dashes = SplayTreeSet<String>();

  @override
  List<String> build() {
    final AsyncValue<SharedPreferences> prefs =
        ref.watch(sharedPrefsInstanceProvider);
    _dashes = SplayTreeSet<String>.from(
      prefs.value?.getStringList(DASHBOARD_LIST_KEY) ?? [],
    );
    return _dashes.toList();
  }

  Future<void> _updateTopics() async {
    await ref
        .read(sharedPrefsInstanceProvider)
        .value
        ?.setStringList(DASHBOARD_LIST_KEY, _dashes.toList());
  }

  Future<void> addDash(final String topic) async {
    _dashes.add(topic);
    await _updateTopics();
    ref.invalidateSelf();
  }

  Future<void> removeDash(final String topic) async {
    _dashes.remove(topic);
    await _updateTopics();
    ref.invalidateSelf();
  }

  Future<void> clearDashes() async {
    _dashes.clear();
    await _updateTopics();
    ref.invalidateSelf();
  }
}

@riverpod
DashboardConfig getDashboardConf(final Ref ref,
    {required final String dashName}) {
  return DashboardConfig(data: [
    "BMS/Pack/Current",
    "BMS/Pack/SOC",
    "DTI/Power/DC_Current",
    "MPU/State/Speed",
    "MPU/State/Mode",
    "MPU/State/ModeIndex",
    "BMS/Cells/Temp_High_Value",
    "BMS/Cells/Temp_Low_Value"
  ], crossAxisCount: 5);
}
