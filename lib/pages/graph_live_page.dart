import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../connection/base_data.dart';

class GraphLivePage extends ConsumerWidget {
  final String topic;
  const GraphLivePage({required this.topic, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final NetFieldCapture<(List<double>, DateTime)>? item = ref.watch(
      capModelHolderProvider.select(
        (
          final AsyncValue<
                  Map<String, NetFieldCapture<(List<double>, DateTime)>>>
              it,
        ) =>
            it.value?[topic],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(topic),
      ),
      body: GraphLive(
        topic: topic,
        item: item!,
      ),
    );
  }
}

class GraphLive extends StatefulWidget {
  final String topic;
  final NetFieldCapture<(List<double>, DateTime)> item;
  const GraphLive({required this.topic, required this.item, super.key});

  @override
  State<GraphLive> createState() => _GraphLiveState();
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}

class _GraphLiveState extends State<GraphLive> {
  final List<ChartData> data = <ChartData>[];
  late StreamSubscription<(List<double>, DateTime)> dataStream;
  ChartSeriesController<ChartData, DateTime>? ctrlr;

  @override
  void initState() {
    dataStream = widget.item
        .getStream()
        .listen((final (List<double>, DateTime) a) async {
      await _addDataPoint(ChartData(a.$2, a.$1.first));
    });
    super.initState();
  }

  @override
  void dispose() {
    unawaited(dataStream.cancel());

    super.dispose();
  }

  Future<void> _addDataPoint(final ChartData point) async {
    data.add(point);
    if (data.last.x.difference(data.first.x) > const Duration(minutes: 1)) {
      data.removeAt(0);
      ctrlr?.updateDataSource(
        addedDataIndexes: <int>[data.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      ctrlr?.updateDataSource(
        addedDataIndexes: <int>[data.length - 1],
      );
    }
  }

  @override
  Widget build(final BuildContext context) => SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        primaryYAxis: NumericAxis(labelFormat: '{value} ${widget.item.unit}'),
        series: <CartesianSeries<ChartData, DateTime>>[
          LineSeries<ChartData, DateTime>(
            onRendererCreated: (
              final ChartSeriesController<ChartData, DateTime> controller,
            ) {
              ctrlr = controller;
            },
            dataSource: data,
            xValueMapper: (final ChartData data, final int index) => data.x,
            yValueMapper: (final ChartData data, final int index) => data.y,
          ),
        ],
      );
}
