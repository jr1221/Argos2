import 'package:flutter/material.dart';

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
    return ListView(
      shrinkWrap: true,
      children: [SocketUriForm()],
    );
  }
}

class SocketUriForm extends StatefulWidget {
  const SocketUriForm({super.key});

  @override
  State<SocketUriForm> createState() => _SocketUriFormState();
}

class _SocketUriFormState extends State<SocketUriForm> {
  final _backendFormKey = GlobalKey<FormState>();
  final _backendFormText = TextEditingController();

  @override
  void dispose() {
    _backendFormText.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _updateData();
    super.initState();
  }

  void _updateData() {
    SharedPreferencesClass.restore(BACKEND_URI_KEY).then((value) {
      _backendFormText.text = (value ?? BACKEND_URI_DEFAULT).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Form(
          key: _backendFormKey,
          child: Expanded(
            child: TextFormField(
              controller: _backendFormText,
              decoration: const InputDecoration(
                  icon: Icon(Icons.settings_input_antenna_outlined),
                  hintText: 'Defaults to the Hermes router',
                  labelText: 'Backend URI'),
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
            onPressed: () async {
              if (_backendFormKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Processing Data, please restart app in a sec')),
                );
                print(_backendFormText.text);
                await SharedPreferencesClass.save(
                    BACKEND_URI_KEY, _backendFormText.text);
                setState(() {
                  _updateData();
                });
              }
            },
            child: const Text('Save')),
      ],
    );
  }
}
