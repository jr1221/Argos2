import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

part 'global_settings.g.dart';

/// a package of all the current connection properties
@immutable
class ConnectionProps {
  /// current uri, see [useMqtt] if the uri is [mqttUri] or [socketUri]
  final Uri uri;
  /// true if app is in MQTT mode
  final bool useMqtt;
  /// mqtt URI to use
  final Uri mqttUri;
  /// socket URI to use
  final Uri socketUri;

  const ConnectionProps(
    this.uri,
    this.mqttUri,
    this.socketUri, {
    required this.useMqtt,
  });
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
        (_useMqtt ? _mqttUri : _socketUri) ?? Uri.parse(BACKEND_URI_KEY),
        _mqttUri ?? Uri.parse(MQTT_URI_KEY),
        _socketUri ?? Uri.parse(BACKEND_URI_KEY),
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

/// Get a shared preferences instance
@riverpod
Future<SharedPreferences> sharedPrefsInstance(final Ref ref) =>
    SharedPreferences.getInstance();
