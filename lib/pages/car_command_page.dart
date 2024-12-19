import 'package:argos2/services/car_command.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_data.dart';

class CarCommandPage extends StatelessWidget {
  const CarCommandPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<CapModel>().getCommandCaps();
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

class CommandPkg extends StatefulWidget {
  final MapEntry<String, List<NetFieldCapture<List<double>>>> topics;

  const CommandPkg({super.key, required this.topics});

  @override
  State<CommandPkg> createState() => _CommandPkgState();
}

class _CommandPkgState extends State<CommandPkg> {
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
                                            .labelSmall
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
              onPressed: () async {
                if (_sendFormKey.currentState!.validate()) {
                  _sendFormKey.currentState?.save();
                  final errored =
                      await sendConfigCommand(widget.topics.key, dataSend);
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
              },
              child: const Text('Send')),
        ],
      ),
    );
  }
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
