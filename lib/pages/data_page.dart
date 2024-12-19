import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../connection/base_data.dart';

class DataPage extends ConsumerWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caps = ref.watch(capModelProvider);
    return switch (caps) {
      AsyncData(:final value) => DataExpander(items: value.values.toList()),
      AsyncError(:final error) => Text('Oops $error'),
      _ => const CircularProgressIndicator(),
    };
  }
}

class DataExpander extends StatefulWidget {
  final List<NetFieldCapture<List<double>>> items;
  const DataExpander({super.key, required this.items});

  @override
  State<DataExpander> createState() => _DataExpanderState();
}

class _DataExpanderState extends State<DataExpander> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a tree structure from the topics
    final Map<String, dynamic> tree = _buildTree(widget.items);

    return ListView(
      shrinkWrap: true,
      children: _buildExpansionTiles(tree, 0),
    );
  }

  // Build a hierarchical tree from the list of items
  Map<String, dynamic> _buildTree(List<NetFieldCapture<List<double>>> items) {
    final Map<String, dynamic> root = {};

    for (var item in items) {
      List<String> parts = item.topic.split('/');
      Map<String, dynamic> currentLevel = root;

      for (var i = 0; i < parts.length; i++) {
        final part = parts[i];

        // If this is the last part, add the netfieldcapture to the list
        if (i == parts.length - 1) {
          if (!currentLevel.containsKey('items')) {
            currentLevel['items'] = [];
          }
          (currentLevel['items'] as List).add(item);
        } else {
          // Otherwise, continue building the tree
          if (!currentLevel.containsKey(part)) {
            currentLevel[part] = <String, dynamic>{};
          }
          currentLevel = currentLevel[part] as Map<String, dynamic>;
        }
      }
    }

    return root;
  }

  // Build the ExpansionTiles recursively
  List<Widget> _buildExpansionTiles(Map<String, dynamic> tree, int level) {
    return tree.entries.where((entry) => entry.key != 'items').map(
      (entry) {
        return Padding(
          padding: EdgeInsets.only(left: level * 16.0),
          child: ExpansionTile(
            title: Text(entry.key),
            children: [
              ..._buildExpansionTiles(entry.value, level + 1),
              if (entry.value.containsKey('items'))
                ..._buildListItems(entry.value['items'] as List, level),
            ],
          ),
        );
      },
    ).toList();
  }

  // Build the final list items
  List<dynamic> _buildListItems(List items, int level) {
    return items.map(
      (item) {
        assert(item.runtimeType == NetFieldCapture<List<double>>);
        return StreamBuilder<List<double>>(
          stream: item.getStream(),
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('NONE');
              case ConnectionState.waiting:
                return Text('WAITING');
              case ConnectionState.active:
                final Color? textColor = item.stale ? Colors.red : null;
                return Padding(
                  padding: EdgeInsets.only(left: level * 16.0, right: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          item.topic.split('/').last,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: textColor),
                        ),
                      ),
                      Text('${snapshot.data?.join(',')} ${item.unit}')
                    ],
                  ),
                );
              case ConnectionState.done:
                return Text('DONE');
            }
          },
        );
      },
    ).toList();
  }
}
