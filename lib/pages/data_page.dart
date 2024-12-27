import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../connection/base_data.dart';
import '../global_settings.dart';

class DataPage extends ConsumerWidget {
  const DataPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final AsyncValue<Map<String, NetFieldCapture<List<double>>>> caps =
        ref.watch(capModelHolderProvider);
    return switch (caps) {
      AsyncData<Map<String, NetFieldCapture<List<double>>>>(
        :final Map<String, NetFieldCapture<List<double>>> value
      ) =>
        DataExpander(
          items: value.values.toList(),
        ),
      AsyncError<Object>(:final Object error) => ErrorViewer(error: error),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class ErrorViewer extends ConsumerWidget {
  final Object? error;
  const ErrorViewer({required this.error, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Error: $error'),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(capModelHolderProvider);
            },
            child: const Text('Retry'),
          ),
        ],
      );
}

class DataExpander extends ConsumerStatefulWidget {
  final List<NetFieldCapture<List<double>>> items;
  const DataExpander({
    required this.items,
    super.key,
  });

  @override
  ConsumerState<DataExpander> createState() => _DataExpanderState();
}

class _DataExpanderState extends ConsumerState<DataExpander> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    // Build a tree structure from the topics
    final Map<String, dynamic> tree = _buildTree(widget.items);

    return ListView(
      shrinkWrap: true,
      children: _buildExpansionTiles(tree, 0),
    );
  }

  // Build a hierarchical tree from the list of items
  Map<String, dynamic> _buildTree(
    final List<NetFieldCapture<List<double>>> items,
  ) {
    final Map<String, dynamic> root = <String, dynamic>{};

    for (final NetFieldCapture<List<double>> item in items) {
      final List<String> parts = item.topic.split('/');
      Map<String, dynamic> currentLevel = root;

      for (int i = 0; i < parts.length; i++) {
        final String part = parts[i];

        // If this is the last part, add the netfieldcapture to the list
        if (i == parts.length - 1) {
          if (!currentLevel.containsKey('items')) {
            currentLevel['items'] = <dynamic>[];
          }
          (currentLevel['items'] as List<dynamic>).add(item);
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
  List<Widget> _buildExpansionTiles(
    final Map<String, dynamic> tree,
    final int level,
  ) =>
      tree.entries
          .where(
            (final MapEntry<String, dynamic> entry) => entry.key != 'items',
          )
          .map(
            (final MapEntry<String, dynamic> entry) => Padding(
              padding: EdgeInsets.only(left: level * 8.0),
              child: ExpansionTile(
                title: Text(entry.key),
                children: <Widget>[
                  ..._buildExpansionTiles(entry.value, level + 1),
                  if (entry.value.containsKey('items'))
                    ..._buildListItems(
                      entry.value['items'] as List<dynamic>,
                      level,
                    ),
                ],
              ),
            ),
          )
          .toList();

  // Build the final list items
  List<dynamic> _buildListItems(final List<dynamic> items, final int level) =>
      items.map(
        (final dynamic item) {
          assert(
            item.runtimeType == NetFieldCapture<List<double>>,
            'Failure to ensure NetField existence',
          );
          return DataPoint(
            item: item as NetFieldCapture<List<double>>,
            level: level,
          );
        },
      ).toList();
}

class DataPoint extends ConsumerWidget {
  final NetFieldCapture<List<double>> item;
  final int level;

  const DataPoint({
    required this.item,
    required this.level,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final bool isFav = ref.watch(
      favoriteTopicsManagerProvider
          .select((final SplayTreeSet<String> it) => it.contains(item.topic)),
    );
    return StreamBuilder<List<double>>(
      stream: item.getStream(),
      builder: (
        final BuildContext context,
        final AsyncSnapshot<List<double>> snapshot,
      ) {
        final Color? textColor = item.stale ? Colors.red : null;
        final IconData isFavIcon = isFav ? Icons.star : Icons.star_border;
        final Iterable<String>? data =
            snapshot.data?.map((final double e) => e.toStringAsFixed(4));
        return Padding(
          padding: EdgeInsets.only(left: level * 8.0, right: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      if (isFav) {
                        await ref
                            .read(favoriteTopicsManagerProvider.notifier)
                            .removeTopic(item.topic);
                      } else {
                        await ref
                            .read(favoriteTopicsManagerProvider.notifier)
                            .addTopic(item.topic);
                      }
                    },
                    icon: Icon(isFavIcon),
                  ),
                  Text(
                    item.topic.split('/').last,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: textColor),
                    '${data?.join('\n')}',
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(item.unit),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
