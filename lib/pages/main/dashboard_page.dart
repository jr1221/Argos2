import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../connection/base_data.dart';
import '../../global_settings.dart';
import '../../services/dashboard_service.dart';
import '../../services/datatype_service.dart';

class DashboardPageCertainPage extends ConsumerWidget {
  final String dashboardName;
  const DashboardPageCertainPage({required this.dashboardName, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final DashboardConfig value =
        ref.watch(GetDashboardConfProvider(dashName: dashboardName));
    return Scaffold(
      appBar: AppBar(
        title: Text(dashboardName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        crossAxisCount: value.crossAxisCount,
        primary: true,
        children: value.data
            .map((final String d) => DataSquare(dataTypeName: d))
            .toList(),
      ),
    );
  }
}

class DataSquare extends ConsumerWidget {
  final String dataTypeName;
  const DataSquare({required this.dataTypeName, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final Map<String, NetFieldCapture<(List<double>, DateTime)>>? allItems =
        ref.watch(capModelHolderProvider).value;
    final NetFieldCapture<(List<double>, DateTime)>? item =
        allItems?[dataTypeName];
    if (item != null) {
      return GridTile(
        header: GridTileBar(
          title: Text(item.topic),
        ),
        child: InkWell(
          onDoubleTap: () async {
            ref.read(graphTopicsManagerProvider.notifier).setTopics(
              <PublicDataType>[
                PublicDataType(name: item.topic, unit: item.unit),
              ],
            );
            await context.push(
              '/graph',
            );
          },
          child: Center(
            child: StreamBuilder<(List<double>, DateTime)>(
              stream: item.getStream(),
              builder: (
                final BuildContext context,
                final AsyncSnapshot<(List<double>, DateTime)> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('NONE');
                  case ConnectionState.waiting:
                    return const Text('WAITING');
                  case ConnectionState.active:
                    return Text('${snapshot.data?.$1.first} ${item.unit}');
                  case ConnectionState.done:
                    return const Text('DONE');
                }
              },
            ),
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
