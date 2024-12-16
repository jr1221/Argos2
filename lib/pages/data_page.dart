import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_data.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Data Page'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Center(child: DataConsumer()),
      bottomSheet: Consumer<CapModel>(
        builder: (BuildContext context, CapModel value, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder<List<double>>(
                stream: value.getCapture('Latency')?.getStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<double>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('NONE');
                    case ConnectionState.waiting:
                      return Text('WAITING');
                    case ConnectionState.active:
                      return Text('Latency: ${snapshot.data?.first} ms');
                    case ConnectionState.done:
                      return Text('DONE');
                  }
                },
              ),
              StreamBuilder<List<double>>(
                stream: value.getCapture('Viewers')?.getStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<double>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('NONE');
                    case ConnectionState.waiting:
                      return Text('WAITING');
                    case ConnectionState.active:
                      return Text(
                          'Current Viewers: ${snapshot.data?.first.round()}');
                    case ConnectionState.done:
                      return Text('DONE');
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class DataConsumer extends StatelessWidget {
  const DataConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CapModel>(
      builder: (BuildContext context, CapModel value, Widget? child) {
        return DataExpander(items: value.getCaps());
      },
    );
  }
}

class DataExpander extends StatelessWidget {
  final List<NetFieldCapture<List<double>>> items;

  const DataExpander({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // Build a tree structure from the topics
    final Map<String, dynamic> tree = _buildTree(items);

    return ListView(
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
                      Text(
                        item.topic.split('/').last,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: textColor),
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

