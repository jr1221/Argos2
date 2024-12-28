import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../connection/base_data.dart';
import '../../global_settings.dart';
import '../../services/datatype_service.dart';

class GraphLiveMgr extends ConsumerWidget {
  const GraphLiveMgr({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final Duration liveGraphDur = ref.watch(liveGraphSettingsManagerProvider);
    final HashSet<PublicDataType> selectedItems =
        ref.watch(graphTopicsManagerProvider);
    final Map<String, NetFieldCapture<(List<double>, DateTime)>>? allItems =
        ref.watch(capModelHolderProvider).value;

    final List<NetFieldCapture<(List<double>, DateTime)>> itemsToDisplay =
        allItems?.values
                .where(
                  (final NetFieldCapture<(List<double>, DateTime)> e) =>
                      selectedItems.contains(
                    e.publicDataType,
                  ),
                )
                .toList() ??
            <NetFieldCapture<(List<double>, DateTime)>>[];
    return GraphLive(
      items: itemsToDisplay,
      liveGraphDur: liveGraphDur,
      key: UniqueKey(),
    );
  }
}

class GraphLive extends ConsumerStatefulWidget {
  final List<NetFieldCapture<(List<double>, DateTime)>> items;
  final Duration liveGraphDur;
  const GraphLive({
    required this.items,
    required this.liveGraphDur,
    super.key,
  });

  @override
  ConsumerState<GraphLive> createState() => _GraphLiveState();
}

class _GraphLiveState extends ConsumerState<GraphLive> {
  final Map<String, LiveGraphRenderInfo> info = <String, LiveGraphRenderInfo>{};

  @override
  void initState() {
    // initialize all of the packages
    for (final NetFieldCapture<(List<double>, DateTime)> item in widget.items) {
      // also lets build a subscription here
      info[item.topic] = LiveGraphRenderInfo(item, widget.liveGraphDur)
        ..beginSubscription();
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final LiveGraphRenderInfo e in info.values) {
      unawaited(
        e.streamSub.cancel(),
      );
    }

    super.dispose();
  }

  /// gets all series
  List<LineSeries<ChartData, DateTime>> _fetchSeries() =>
      info.values.map((final LiveGraphRenderInfo e) => e.getSeries()).toList();

  /// gets all axes.  matches to above via topic name as the axis key
  List<ChartAxis> _fetchAxes() =>
      info.values.map((final LiveGraphRenderInfo e) => e.getAxis()).toList();

  @override
  Widget build(final BuildContext context) => SfCartesianChart(
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.jms(),
        ),
        primaryYAxis: const NumericAxis(
          isVisible: false,
        ),
        series: _fetchSeries(),
        axes: _fetchAxes(),
      );
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}

class LiveGraphRenderInfo {
  final NetFieldCapture<(List<double>, DateTime)> item;
  final List<ChartData> data = <ChartData>[];
  late StreamSubscription<(List<double>, DateTime)> streamSub;
  final Duration windowLength;

  ChartSeriesController<ChartData, DateTime>? ctrlr;

  LiveGraphRenderInfo(this.item, this.windowLength);

  /// begin the data subscription
  void beginSubscription() {
    streamSub =
        item.getStream().listen((final (List<double>, DateTime) a) async {
      addPoint(ChartData(a.$2, a.$1.first), windowLength);
    });
  }

  /// get the axes to render
  NumericAxis getAxis() => NumericAxis(
        name: item.topic,
        labelFormat: '{value} ${item.unit}',
        title: AxisTitle(text: item.topic),
      );

  /// get the axes, must resolve internally or add point will be useless
  LineSeries<ChartData, DateTime> getSeries() =>
      LineSeries<ChartData, DateTime>(
        onRendererCreated: (
          final ChartSeriesController<ChartData, DateTime> controller,
        ) {
          ctrlr = controller;
        },
        yAxisName: item.topic,
        dataSource: data,
        xValueMapper: (final ChartData data, final int index) => data.x,
        yValueMapper: (final ChartData data, final int index) => data.y,
      );

  /// add a point to the graph.  Only useful if ctrlr != null
  void addPoint(final ChartData point, final Duration windowLength) {
    data.add(point);
    if ((data.last.x.difference(data.first.x)) > windowLength) {
      data.removeAt(0);
      ctrlr?.updateDataSource(
        addedDataIndex: data.length - 1,
        removedDataIndex: 0,
      );
    } else {
      ctrlr?.updateDataSource(
        addedDataIndex: data.length - 1,
      );
    }
  }
}
