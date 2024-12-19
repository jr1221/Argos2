import 'package:argos2/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_settings.g.dart';

class ConnectionProps {
  final Uri uri;
  final bool useMqtt;

  ConnectionProps(this.uri, this.useMqtt);

  @override
  bool operator ==(Object other) =>
      other is ConnectionProps && other.useMqtt == useMqtt && other.uri == uri;

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(uri.hashCode, useMqtt.hashCode);
}

@riverpod
class ConnectionControl extends _$ConnectionControl {
  bool _useMqtt = false;
  Uri _mqttUri = Uri.base;
  Uri _socketUri = Uri.base;

  @override
  bool updateShouldNotify(ConnectionProps previous, ConnectionProps next) {
    // TODO: implement updateShouldNotify
    return previous != next;
  }

  @override
  ConnectionProps build() =>
      ConnectionProps(_useMqtt ? _mqttUri : _socketUri, _useMqtt);

  init() async {
    _mqttUri = Uri.parse(
        await SharedPreferencesClass.restore(MQTT_URI_KEY) as String? ??
            MQTT_URI_DEFAULT);
    _socketUri = Uri.parse(
        await SharedPreferencesClass.restore(BACKEND_URI_KEY) as String? ??
            BACKEND_URI_DEFAULT);
    ref.invalidateSelf();
  }

  switchToMqtt() async {
    _useMqtt = true;
    _mqttUri = Uri.parse(
        await SharedPreferencesClass.restore(MQTT_URI_KEY) as String? ??
            MQTT_URI_DEFAULT);
    ref.invalidateSelf();
  }

  switchToSocket() async {
    _useMqtt = false;
    _socketUri = Uri.parse(
        await SharedPreferencesClass.restore(BACKEND_URI_KEY) as String? ??
            BACKEND_URI_DEFAULT);
    ref.invalidateSelf();
  }

  setMqttUri(Uri uri) async {
    _mqttUri = uri;
    ref.invalidateSelf();
  }

  setSocketUri(Uri uri) async {
    _socketUri = uri;
    print(state == ConnectionProps(uri, _useMqtt));
    ref.invalidateSelf();
  }
}
