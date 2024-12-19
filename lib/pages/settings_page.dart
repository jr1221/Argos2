import 'package:argos2/global_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Settings'),
      ),
      body: const Center(child: Settings()),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MqttToggleSwitch(),
        UriForm(
          hintText: 'Defaults to the Hermes router',
          labelText: 'Backend URI',
          icon: Icons.settings_input_antenna_outlined,
          defaultVal: BACKEND_URI_DEFAULT,
          storageKey: BACKEND_URI_KEY,
          mqttUri: false,
        ),
        UriForm(
          hintText: 'Defaults to the Hermes router',
          labelText: 'MQTT URI',
          icon: Icons.import_export_sharp,
          defaultVal: MQTT_URI_DEFAULT,
          storageKey: MQTT_URI_KEY,
          mqttUri: true,
        )
      ],
    );
  }
}

class MqttToggleSwitch extends ConsumerStatefulWidget {
  const MqttToggleSwitch({super.key});

  @override
  ConsumerState<MqttToggleSwitch> createState() => _MqttToggleSwitchState();
}

class _MqttToggleSwitchState extends ConsumerState<MqttToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    final isMqtt = ref.watch(connectionControlProvider).useMqtt;
    return SwitchListTile(
      title: const Text('Enable MQTT viewing mode'),
      secondary: const Icon(Icons.import_export_sharp),
      subtitle: kIsWeb
          ? const Text('(disabled on web)')
          : const Text('Some features will be disabled'),
      value: isMqtt,
      onChanged: kIsWeb
          ? null
          : (bool val) {
              if (val) {
                ref.read(connectionControlProvider.notifier).switchToMqtt();
              } else {
                ref.read(connectionControlProvider.notifier).switchToSocket();
              }
            },
    );
  }
}

class UriForm extends ConsumerStatefulWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final String defaultVal;
  final String storageKey;

  /// true for mqtt, false for socket
  final bool mqttUri;
  const UriForm(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.defaultVal,
      required this.storageKey,
      required this.mqttUri});

  @override
  ConsumerState<UriForm> createState() => _UriFormState();
}

class _UriFormState extends ConsumerState<UriForm> {
  final _uriFormKey = GlobalKey<FormState>();
  final _uriFormText = TextEditingController();

  @override
  void dispose() {
    _uriFormText.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _updateData();
    super.initState();
  }

  void _updateData() {
    SharedPreferencesClass.restore(widget.storageKey).then((value) {
      _uriFormText.text = (value ?? widget.defaultVal).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Form(
          key: _uriFormKey,
          child: Flexible(
            child: TextFormField(
              controller: _uriFormText,
              decoration: InputDecoration(
                  icon: Icon(widget.icon),
                  hintText: widget.hintText,
                  labelText: widget.labelText),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    Uri.tryParse(value) == null) {
                  return 'Please enter a valid URI';
                }
                return null;
              },
            ),
          ),
        ),
        ElevatedButton(
            onPressed: (kIsWeb && widget.mqttUri)
                ? null
                : () async {
                    if (_uriFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      await SharedPreferencesClass.save(
                          widget.storageKey, _uriFormText.text);
                      setState(() {
                        _updateData();
                      });
                      if (widget.mqttUri) {
                        ref
                            .read(connectionControlProvider.notifier)
                            .setMqttUri(Uri.parse(_uriFormText.text));
                      } else {
                        ref
                            .read(connectionControlProvider.notifier)
                            .setSocketUri(Uri.parse(_uriFormText.text));
                      }
                    }
                  },
            child: const Text('Save')),
      ],
    );
  }
}
