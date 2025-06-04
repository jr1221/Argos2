import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../services/rule_service.dart';

class RuleManagerPage extends ConsumerWidget {
  const RuleManagerPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final HashSet<Rule> rules =
        ref.watch(ruleManagerProvider).value ?? HashSet<Rule>();
    return ListView(
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (final BuildContext context) => SimpleDialog(
                    title: const Text('Add Rules'),
                    children: <Widget>[
                      const NewRuleForm(),
                      TextButton.icon(
                        onPressed: context.pop,
                        label: const Text('Exit'),
                        icon: const Icon(Icons.exit_to_app),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Add Rule'),
            ),
            ElevatedButton(
              onPressed: () async {
                ref.invalidate(ruleManagerProvider);
              },
              child: const Text('Re-send rules'),
            ),
          ],
        ),
        const Text(
          'Tap a notification to delete it',
          textAlign: TextAlign.center,
        ),
        for (final Rule rule in rules)
          ListTile(
            title: Text(rule.id),
            subtitle: Text(rule.topic),
            trailing: Text(rule.expr),
            leading: Text('Debounce: ${rule.debounce_time}'),
            onLongPress: ()  async {
              await ref.read(ruleManagerProvider.notifier).deleteRule(rule.id);
            },
          )
      ],
    );
  }
}

class NewRuleForm extends ConsumerStatefulWidget {
  const NewRuleForm({
    super.key,
  });

  @override
  ConsumerState<NewRuleForm> createState() => _NewRuleFormState();
}

class _NewRuleFormState extends ConsumerState<NewRuleForm> {
  final TextEditingController _idFormText = TextEditingController();
  final TextEditingController _topicFormText = TextEditingController();
  final TextEditingController _debounceTimeFormText = TextEditingController();
  final TextEditingController _exprFormText = TextEditingController();

  final GlobalKey<FormState> _idFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _topicFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _debounceTimeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _exprFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idFormText.dispose();
    _topicFormText.dispose();
    _debounceTimeFormText.dispose();
    _exprFormText.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            key: _idFormKey,
            child: Flexible(
              child: TextFormField(
                controller: _idFormText,
                decoration: const InputDecoration(
                  icon: Icon(Icons.insert_drive_file),
                  labelText: 'Rule name',
                ),
                onTapOutside: (final PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (final String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
            ),
          ),
          Form(
            key: _topicFormKey,
            child: Flexible(
              child: TextFormField(
                controller: _topicFormText,
                decoration: const InputDecoration(
                  icon: Icon(Icons.line_axis_sharp),
                  labelText: 'Topic',
                ),
                onTapOutside: (final PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (final String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
            ),
          ),
          Form(
            key: _debounceTimeFormKey,
            child: Flexible(
              child: TextFormField(
                controller: _debounceTimeFormText,
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  labelText: 'Debounce Time',
                ),
                onTapOutside: (final PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (final String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
            ),
          ),
          Form(
            key: _exprFormKey,
            child: Flexible(
              child: TextFormField(
                controller: _exprFormText,
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  labelText: 'Expression',
                ),
                onTapOutside: (final PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (final String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_idFormKey.currentState!.validate() &&
                  _topicFormKey.currentState!.validate() &&
                  _debounceTimeFormKey.currentState!.validate() &&
                  _exprFormKey.currentState!.validate()) {
                await ref.read(ruleManagerProvider.notifier).registerRule(
                      Rule(
                          id: _idFormText.text,
                          topic: _topicFormText.text,
                          debounce_time: int.parse(_debounceTimeFormText.text),
                          expr: _exprFormText.text),
                    );

                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added rule!')),
                );

                context.pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
}
