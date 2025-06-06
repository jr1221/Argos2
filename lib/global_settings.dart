import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'services/datatype_service.dart';

part 'global_settings.freezed.dart';
part 'global_settings.g.dart';

/// a package of all the current connection properties
@freezed
abstract class ConnectionProps with _$ConnectionProps {
  const factory ConnectionProps({
    /// current uri, see [useMqtt] if the uri is [mqttUri] or [socketUri]
    required final Uri uri,

    /// mqtt URI to use
    required final Uri mqttUri,

    /// socket URI to use
    required final Uri socketUri,

    /// true if app is in MQTT mode
    required final bool useMqtt,
  }) = _ConnectionProps;
}

@riverpod
class ConnectionControl extends _$ConnectionControl {
  bool _useMqtt = false;
  Uri? _mqttUri;
  Uri? _socketUri;

  @override
  ConnectionProps build() {
    // require the shared prefs
    final AsyncValue<SharedPreferences> prefs =
        ref.watch(sharedPrefsInstanceProvider);
    _mqttUri = Uri.parse(
      prefs.value?.getString(MQTT_URI_KEY) ?? MQTT_URI_DEFAULT,
    );
    _socketUri = Uri.parse(
      prefs.value?.getString(BACKEND_URI_KEY) ?? BACKEND_URI_DEFAULT,
    );
    return _conn;
  }

  /// build a ConnectionProps object from the internal state
  ConnectionProps get _conn => ConnectionProps(
        uri: (_useMqtt ? _mqttUri : _socketUri) ?? Uri.parse(BACKEND_URI_KEY),
        mqttUri: _mqttUri ?? Uri.parse(MQTT_URI_KEY),
        socketUri: _socketUri ?? Uri.parse(BACKEND_URI_KEY),
        useMqtt: _useMqtt,
      );

  /// switch app to MQTT mode
  Future<void> switchToMqtt() async {
    _useMqtt = true;
    ref.invalidateSelf();
  }

  /// switch app to Socket mode
  Future<void> switchToSocket() async {
    _useMqtt = false;
    ref.invalidateSelf();
  }

  /// Set the MQTT Uri, see [switchToMqtt] to use the uri
  Future<void> setMqttUri(final Uri uri) async {
    _mqttUri = uri;
    await ref
        .read(sharedPrefsInstanceProvider)
        .value
        ?.setString(MQTT_URI_KEY, uri.toString());
    ref.invalidateSelf();
  }

  /// Set the Socket Uri, see [switchToSocket] to use the uri
  Future<void> setSocketUri(final Uri uri) async {
    _socketUri = uri;
    await ref
        .read(sharedPrefsInstanceProvider)
        .value
        ?.setString(BACKEND_URI_KEY, uri.toString());
    ref.invalidateSelf();
  }
}

@riverpod
class FavoriteTopicsManager extends _$FavoriteTopicsManager {
  HashSet<PublicDataType> _topics =
      HashSet<PublicDataType>();
  @override
  HashSet<PublicDataType> build() {
    final AsyncValue<SharedPreferences> prefs =
        ref.watch(sharedPrefsInstanceProvider);
    _topics = HashSet<PublicDataType>.from(
      prefs.value?.getStringList(FAVORITE_TOPICS_KEY)?.map(
                (final String f) => PublicDataType.fromJson(jsonDecode(f)),
              ) ??
          FAVORITE_TOPICS_DEFAULT,
    );
    return _topics;
  }

  Future<void> _updateTopics() async {
    await ref.read(sharedPrefsInstanceProvider).value?.setStringList(
          FAVORITE_TOPICS_KEY,
          _topics
              .map((final PublicDataType f) => jsonEncode(f.toJson()))
              .toList(),
        );
  }

  Future<void> addTopic(final PublicDataType topic) async {
    _topics.add(topic);
    await _updateTopics();
    ref.invalidateSelf();
  }

  Future<void> removeTopic(final PublicDataType topic) async {
    _topics.remove(topic);
    await _updateTopics();
    ref.invalidateSelf();
  }

  Future<void> clearTopics() async {
    _topics.clear();
    await _updateTopics();
    ref.invalidateSelf();
  }
}

@riverpod
class GraphTopicsManager extends _$GraphTopicsManager {
  HashSet<PublicDataType> _graphTopics = HashSet<PublicDataType>();

  @override
  HashSet<PublicDataType> build() {
    ref.keepAlive();
    return _graphTopics;
  }

  void setTopics(final List<PublicDataType> topics) {
    _graphTopics = HashSet<PublicDataType>.from(topics);
    state = _graphTopics;
  }

  void addTopic(final PublicDataType topic) {
    if (_graphTopics.add(topic)) {
      state = _graphTopics;
    }
  }
}

@riverpod
class HistoricalGraphRunManager extends _$HistoricalGraphRunManager {
  int _runId = 0;

  @override
  int build() {
    ref.keepAlive();
    return _runId;
  }

  void setRunId(final int runId) {
    _runId = runId;
    ref.invalidateSelf();
  }
}

/// Get a shared preferences instance
@riverpod
Future<SharedPreferences> sharedPrefsInstance(final Ref ref) {
  ref.keepAlive();
  return SharedPreferences.getInstance();
}

@riverpod
class LiveGraphSettingsManager extends _$LiveGraphSettingsManager {
  @override
  Duration build() {
    final AsyncValue<SharedPreferences> prefs =
        ref.watch(sharedPrefsInstanceProvider);

    final int res = prefs.value?.getInt(LIVE_GRAPH_DURATION_KEY) ??
        LIVE_GRAPH_DURATION_DEFAULT;

    return Duration(seconds: res);
  }

  Future<void> setDuration(final Duration graphDir) async {
    await ref
        .read(sharedPrefsInstanceProvider)
        .value
        ?.setInt(LIVE_GRAPH_DURATION_KEY, graphDir.inSeconds);
    ref.invalidateSelf();
  }
}
