import 'package:argos2/global_settings.dart';
import 'package:argos2/services/car_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../connection/base_data.dart';

class CarCommandPage extends ConsumerWidget {
  const CarCommandPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref
        .watch(capModelProvider)
        .value!
        .values
        .where((val) => val.topic.startsWith('Calypso/Bidir/State/'))
        .toList();

    Map<String, List<NetFieldCapture<List<double>>>> i = {};
    for (final item in items) {
      if (i[item.topic.getKey()] != null) {
        i[item.topic.getKey()]?.add(item);
      } else {
        i[item.topic.getKey()] = [item];
      }
    }
    final vals = i.entries;

    return ListView.builder(
        itemCount: vals.length,
        itemBuilder: (BuildContext context, int index) {
          final topics = vals.elementAt(index);
          return CommandPkg(topics: topics);
        });
  }
}

class CommandPkg extends ConsumerStatefulWidget {
  final MapEntry<String, List<NetFieldCapture<List<double>>>> topics;

  const CommandPkg({super.key, required this.topics});

  @override
  ConsumerState<CommandPkg> createState() => _CommandPkgState();
}

class _CommandPkgState extends ConsumerState<CommandPkg> {
  final _sendFormKey = GlobalKey<FormState>();

  final List<double> dataSend = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Center(
            child: Text(widget.topics.key),
          ),
          Form(
            key: _sendFormKey,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.topics.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        onSaved: (final data) {
                          dataSend.add(double.parse(data ?? ''));
                        },
                        decoration: InputDecoration(
                            suffixText: widget.topics.value[index].unit,
                            labelText:
                                'Point ${widget.topics.value[index].topic.getSubKey()}'),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              double.tryParse(value) == null) {
                            return 'Please enter a valid data point';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: Center(
                        child: StreamBuilder<List<double>>(
                          stream: widget.topics.value[index].getStream(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<double>> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return Text('NONE');
                              case ConnectionState.waiting:
                                return Text('WAITING');
                              case ConnectionState.active:
                                final Color? textColor =
                                    widget.topics.value[index].stale
                                        ? Colors.red
                                        : null;
                                return Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, right: 32.0),
                                    child: Text(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: textColor),
                                        '${snapshot.data?.join(',')} ${widget.topics.value[index].unit}'));
                              case ConnectionState.done:
                                return Text('DONE');
                            }
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              onPressed: ref.watch(connectionControlProvider).useMqtt
                  ? null
                  : () async {
                      if (_sendFormKey.currentState!.validate()) {
                        final res = await _confirmationDialog(
                            context, widget.topics.key);
                        if (res != null && res) {
                          _sendFormKey.currentState?.save();
                          final errored = await sendConfigCommand(
                              widget.topics.key, dataSend);
                          dataSend.clear();
                          if (!context.mounted) return;
                          if (errored) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to send data to car!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Processing data, check the current values to ensure car successfully updated!')),
                            );
                          }
                        }
                      }
                    },
              child: const Text('Send to Car')),
        ],
      ),
    );
  }
}

Future<bool?> _confirmationDialog(BuildContext context, String key) async {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(
            Icons.warning,
            size: 48.0,
          ),
          title: const Text('Confirm command to send to car!'),
          content: Text('Changing setting: $key'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Yes, send to car',
                  textAlign: TextAlign.end,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'no, go back',
                  textAlign: TextAlign.end,
                ))
          ],
        );
      });
}

extension GetKeys on String {
  String getKey() {
    return substring('Calypso/Bidir/State/'.length,
        indexOf('/', 'Calypso/Bidir/State/'.length + 1));
  }

  String getSubKey() {
    return split('/').last;
  }
}
