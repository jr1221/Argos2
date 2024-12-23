import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../connection/base_data.dart';
import '../global_settings.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final SplayTreeSet<String> favs = ref.watch(favoriteTopicsManagerProvider);
    return ListView.builder(
      itemCount: favs.length,
      itemBuilder: (final BuildContext context, final int index) =>
          DataPoint(topic: favs.elementAt(index)),
    );
  }
}

class DataPoint extends ConsumerWidget {
  final String topic;
  const DataPoint({required this.topic, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final NetFieldCapture<List<double>>? item = ref.watch(
      capModelHolderProvider.select(
        (final AsyncValue<Map<String, NetFieldCapture<List<double>>>> it) =>
            it.value?[topic],
      ),
    );
    if (item == null) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () async {
                    await ref
                        .read(favoriteTopicsManagerProvider.notifier)
                        .removeTopic(topic);
                  },
                  icon: const Icon(Icons.star),
                ),
                Text(
                  topic.split('/').last,
                ),
              ],
            ),
            const Text(
              'Not Received',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      );
    } else {
      return StreamBuilder<List<double>>(
        stream: item.getStream(),
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<double>> snapshot,
        ) {
          final Color? textColor = item.stale ? Colors.red : null;
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () async {
                        await ref
                            .read(favoriteTopicsManagerProvider.notifier)
                            .removeTopic(item.topic);
                      },
                      icon: const Icon(Icons.star),
                    ),
                    Text(
                      item.topic,
                    ),
                  ],
                ),
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: textColor),
                  '${snapshot.data?.join(',')} ${item.unit}',
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
