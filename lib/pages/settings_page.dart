import 'package:argos2/main.dart';
import 'package:flutter/material.dart';

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

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _backendFormKey = GlobalKey<FormState>();
  final _backendFormText = TextEditingController();

  @override
  void dispose() {
    _backendFormText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
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
                onPressed: () {
                  if (_backendFormKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Processing Data, please restart app in a sec')),
                    );
                    print(_backendFormText.text);
                    SharedPreferencesClass.save(
                        'v1_BackendUri', _backendFormText.text);
                  }
                },
                child: const Text('Submit')),
          ],
        )
      ],
    );
  }
}
