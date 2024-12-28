import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../global_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Settings'),
        ),
        body: const Center(child: Settings()),
      );
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(final BuildContext context) => const Column(
        children: <Widget>[
          MqttToggleSwitch(),
          UriForm(
            labelText: 'Backend URI',
            icon: Icons.settings_input_antenna_outlined,
            mqttUri: false,
          ),
          UriForm(
            labelText: 'MQTT URI',
            icon: Icons.import_export_sharp,
            mqttUri: true,
          ),
          LiveGraphDisplayDuration(),
        ],
      );
}

class MqttToggleSwitch extends ConsumerStatefulWidget {
  const MqttToggleSwitch({super.key});

  @override
  ConsumerState<MqttToggleSwitch> createState() => _MqttToggleSwitchState();
}

class _MqttToggleSwitchState extends ConsumerState<MqttToggleSwitch> {
  @override
  Widget build(final BuildContext context) {
    final bool isMqtt = ref.watch(
      connectionControlProvider
          .select((final ConnectionProps it) => it.useMqtt),
    );
    return SwitchListTile(
      title: const Text('Enable MQTT viewing mode'),
      secondary: const Icon(Icons.import_export_sharp),
      subtitle: kIsWeb
          ? const Text('(disabled on web)')
          : const Text('Some features will be disabled'),
      value: isMqtt,
      onChanged: kIsWeb
          ? null
          : (final bool val) async {
              if (val) {
                await ref
                    .read(connectionControlProvider.notifier)
                    .switchToMqtt();
              } else {
                await ref
                    .read(connectionControlProvider.notifier)
                    .switchToSocket();
              }
            },
    );
  }
}

class UriForm extends ConsumerStatefulWidget {
  final String labelText;
  final IconData icon;

  /// true for mqtt, false for socket
  final bool mqttUri;
  const UriForm({
    required this.labelText,
    required this.icon,
    required this.mqttUri,
    super.key,
  });

  @override
  ConsumerState<UriForm> createState() => _UriFormState();
}

class _UriFormState extends ConsumerState<UriForm> {
  final GlobalKey<FormState> _uriFormKey = GlobalKey<FormState>();
  final TextEditingController _uriFormText = TextEditingController();

  @override
  void dispose() {
    _uriFormText.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    late Uri oldVal;
    if (widget.mqttUri) {
      oldVal = ref.watch(
        connectionControlProvider
            .select((final ConnectionProps it) => it.mqttUri),
      );
    } else {
      oldVal = ref.watch(
        connectionControlProvider
            .select((final ConnectionProps it) => it.socketUri),
      );
    }
    if (_uriFormText.text.isEmpty) {
      _uriFormText.text = oldVal.toString();
    }
    return Row(
      children: <Widget>[
        Form(
          key: _uriFormKey,
          child: Flexible(
            child: TextFormField(
              controller: _uriFormText,
              decoration: InputDecoration(
                icon: Icon(widget.icon),
                labelText: widget.labelText,
                helperText: 'Right click to use default',
              ),
              onTapOutside: (final PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
              contextMenuBuilder: (
                final BuildContext context,
                final EditableTextState editableTextState,
              ) =>
                  AdaptiveTextSelectionToolbar.buttonItems(
                buttonItems: editableTextState.contextMenuButtonItems
                  ..add(
                    ContextMenuButtonItem(
                      onPressed: () {
                        if (widget.mqttUri) {
                          _uriFormText.text = MQTT_URI_DEFAULT;
                        } else {
                          _uriFormText.text = BACKEND_URI_DEFAULT;
                        }
                      },
                      label: 'Use Default',
                    ),
                  ),
                anchors: editableTextState.contextMenuAnchors,
              ),
              validator: (final String? value) {
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
                    if (widget.mqttUri) {
                      await ref
                          .read(connectionControlProvider.notifier)
                          .setMqttUri(Uri.parse(_uriFormText.text));
                    } else {
                      await ref
                          .read(connectionControlProvider.notifier)
                          .setSocketUri(Uri.parse(_uriFormText.text));
                    }
                  }
                },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class LiveGraphDisplayDuration extends ConsumerStatefulWidget {
  const LiveGraphDisplayDuration({
    super.key,
  });

  @override
  ConsumerState<LiveGraphDisplayDuration> createState() =>
      _LiveGraphDisplayDurationState();
}

class _LiveGraphDisplayDurationState
    extends ConsumerState<LiveGraphDisplayDuration> {
  final GlobalKey<FormState> _uriFormKey = GlobalKey<FormState>();
  final TextEditingController _uriFormText = TextEditingController();

  @override
  void dispose() {
    _uriFormText.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final Duration currentVal = ref.watch(liveGraphSettingsManagerProvider);
    if (_uriFormText.text.isEmpty) {
      _uriFormText.text = currentVal.inSeconds.toString();
    }
    return Row(
      children: <Widget>[
        Form(
          key: _uriFormKey,
          child: Flexible(
            child: TextFormField(
              controller: _uriFormText,
              decoration: const InputDecoration(
                icon: Icon(Icons.line_axis_sharp),
                labelText: 'Duration of data to show in live graph',
                helperText: 'Right click to use default',
                suffixText: 'seconds',
              ),
              onTapOutside: (final PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
              contextMenuBuilder: (
                final BuildContext context,
                final EditableTextState editableTextState,
              ) =>
                  AdaptiveTextSelectionToolbar.buttonItems(
                buttonItems: editableTextState.contextMenuButtonItems
                  ..add(
                    ContextMenuButtonItem(
                      onPressed: () {
                        _uriFormText.text =
                            LIVE_GRAPH_DURATION_DEFAULT.toString();
                      },
                      label: 'Use Default',
                    ),
                  ),
                anchors: editableTextState.contextMenuAnchors,
              ),
              validator: (final String? value) {
                if (value == null ||
                    value.isEmpty ||
                    int.tryParse(value) == null) {
                  return 'Please enter a valid URI';
                }
                return null;
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_uriFormKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              await ref
                  .read(liveGraphSettingsManagerProvider.notifier)
                  .setDuration(
                    Duration(
                      seconds: int.parse(_uriFormText.text),
                    ),
                  );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
