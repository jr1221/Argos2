import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../connection/base_data.dart';
import '../global_settings.dart';
import '../services/data_service.dart';
import '../services/run_service.dart';

class GraphPage extends ConsumerStatefulWidget {
  final String topic;
  const GraphPage({required this.topic, super.key});

  @override
  ConsumerState<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends ConsumerState<GraphPage> {
  /// When incremented, invalidates the child widget, resetting the graph
  int resetKey = 0;
  bool isLive = true;
  int runId = 0;
  late List<String> topics;

  @override
  @override
  void initState() {
    // topics default to passed in topic
    topics = <String>[widget.topic];
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    // need to watch for any new topics to display
    final Map<String, NetFieldCapture<(List<double>, DateTime)>>? items = ref
        .watch(
          capModelHolderProvider,
        )
        .value;

    // items we wanna show to the user
    final List<NetFieldCapture<(List<double>, DateTime)>> itemsToDisplay =
        items?.values
                .where(
                  (final NetFieldCapture<(List<double>, DateTime)> it) =>
                      topics.contains(it.topic),
                )
                .toList() ??
            <NetFieldCapture<(List<double>, DateTime)>>[];
    // check whether we are in MQTT mode, as no historical view in MQTT mode
    final bool isMqtt = ref.watch(
      connectionControlProvider
          .select((final ConnectionProps it) => it.useMqtt),
    );

    // get some runs
    final List<PublicRun> runs =
        ref.watch(runHandlerProvider).value ?? <PublicRun>[];

    // get the current setting for our live graph window length
    final Duration liveGraphDur = ref.watch(liveGraphSettingsManagerProvider);

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // make scrollable as selection area is limited
            SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: MultiDropdown<String>(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  searchEnabled: true,
                  onSelectionChange: (final List<String> items) {
                    setState(() {
                      resetKey++;
                      topics = items;
                    });
                  },
                  items: items?.values
                          .map(
                            (final NetFieldCapture<(List<double>, DateTime)>
                                    e,) =>
                                DropdownItem<String>(
                              // for default state and when state invalidated
                              selected: topics.contains(e.topic),
                              label: e.topic,
                              value: e.topic,
                            ),
                          )
                          .toList() ??
                      <DropdownItem<String>>[],
                  chipDecoration: ChipDecoration(
                    backgroundColor: Theme.of(context).highlightColor,
                  ),
                  dropdownDecoration: DropdownDecoration(
                    backgroundColor: Theme.of(context).dialogBackgroundColor,
                    header: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Select topics from the list',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  dropdownItemDecoration: DropdownItemDecoration(
                    selectedBackgroundColor: Theme.of(context).highlightColor,
                    selectedIcon: Icon(
                      Icons.check_box,
                      color: Theme.of(context)
                          .checkboxTheme
                          .fillColor
                          ?.resolve(<WidgetState>{WidgetState.selected}),
                    ),
                    disabledIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  validator: (final List<DropdownItem<String>>? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select one or more topics';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            DropdownMenu<int>(
              enabled: !isLive,
              label: const Text('Select Run'),
              initialSelection: 1,
              onSelected: (final int? id) {
                setState(() {
                  resetKey++;
                  runId = id ?? 0;
                });
              },
              dropdownMenuEntries: runs
                  .map(
                    (final PublicRun run) => DropdownMenuEntry<int>(
                      value: run.id,
                      label: run.id.toString(),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        // show a live or historical widget based on [isLive]
        body: isLive
            ? GraphLive(
                items: itemsToDisplay,
                liveGraphDur: liveGraphDur,
                key: ValueKey<int>(resetKey),
              )
            : GraphHistorical(
                topics: itemsToDisplay
                    .map(
                      (final NetFieldCapture<(List<double>, DateTime)> e) =>
                          e.topic,
                    )
                    .toList(),
                runId: runId,
                units: itemsToDisplay
                    .map(
                      (final NetFieldCapture<(List<double>, DateTime)> e) =>
                          e.unit,
                    )
                    .toList(),
                key: ValueKey<int>(resetKey),
              ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                resetKey++;
              });
            },
            child: const Text('Reset Graph'),
          ),
          Text(
            isMqtt
                ? 'Note: No historical data in MQTT mode'
                : 'Live Mode Enabled?',
          ),
          Switch(
            value: isLive,
            onChanged: isMqtt
                ? null
                : (final bool newLive) {
              setState(() {
                isLive = newLive;
              });
            },
          ),
        ],
    );
  }
}

class GraphLive extends StatefulWidget {
  final List<NetFieldCapture<(List<double>, DateTime)>> items;
  final Duration liveGraphDur;
  const GraphLive({
    required this.items,
    required this.liveGraphDur,
    super.key,
  });

  @override
  State<GraphLive> createState() => _GraphLiveState();
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

class _GraphLiveState extends State<GraphLive> {
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

class GraphHistorical extends ConsumerStatefulWidget {
  final List<String> topics;
  final int runId;
  final List<String> units;
  const GraphHistorical({
    required this.topics,
    required this.runId,
    required this.units,
    super.key,
  });

  @override
  ConsumerState<GraphHistorical> createState() => _GraphHistoricalState();
}

class _GraphHistoricalState extends ConsumerState<GraphHistorical> {
  List<LineSeries<PublicData, DateTime>> _generateSeries(
    final List<List<PublicData>> data,
  ) {
    final List<LineSeries<PublicData, DateTime>> series =
        <LineSeries<PublicData, DateTime>>[];
    assert(data.length == widget.topics.length, 'Less data then topics!');
    for (int i = 0; i < data.length; i++) {
      series.add(
        LineSeries<PublicData, DateTime>(
          name: widget.topics[i],
          dataSource: data[i],
          yAxisName: widget.topics[i],
          xValueMapper: (final PublicData data, final int index) =>
              DateTime.fromMillisecondsSinceEpoch(data.time),
          yValueMapper: (final PublicData data, final int index) =>
              data.values.first,
        ),
      );
    }

    return series;
  }

  List<ChartAxis> _generateAxes() {
    assert(
      widget.units.length == widget.topics.length,
      'Less units then topics!',
    );
    final List<NumericAxis> axes = <NumericAxis>[];
    for (int i = 0; i < widget.units.length; i++) {
      axes.add(
        NumericAxis(
          name: widget.topics[i],
          labelFormat: '{value} ${widget.units[i]}',
          title: AxisTitle(text: widget.topics[i]),
        ),
      );
    }
    return axes;
  }

  @override
  Widget build(final BuildContext context) {
    final AsyncValue<List<List<PublicData>>> data = ref.watch(
      getMultiDataWithRunIdProvider(topics: widget.topics, runId: widget.runId),
    );
    return switch (data) {
      AsyncData<List<List<PublicData>>>(:final List<List<PublicData>> value) =>
        SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enableSelectionZooming: true,
            enablePanning: true,
            enableMouseWheelZooming: true,
            enablePinching: true,
          ),
          legend:
              const Legend(isVisible: true, position: LegendPosition.bottom),
          trackballBehavior: TrackballBehavior(
            activationMode: ActivationMode.singleTap,
            enable: true,
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
            markerSettings: const TrackballMarkerSettings(
              markerVisibility: TrackballVisibilityMode.visible,
            ),
          ),
          primaryXAxis: DateTimeAxis(
            dateFormat: DateFormat.jms(),
          ),
          primaryYAxis: const NumericAxis(
            isVisible: false,
          ),
          axes: _generateAxes(),
          series: _generateSeries(value),
        ),
      AsyncError<Object?>(:final Object? error) => ErrorViewer(
          error: error,
          topics: widget.topics,
          runId: widget.runId,
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class ErrorViewer extends ConsumerWidget {
  final Object? error;
  final List<String> topics;
  final int runId;
  const ErrorViewer({
    required this.error,
    required this.topics,
    required this.runId,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Error: $error'),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(
                getMultiDataWithRunIdProvider(topics: topics, runId: runId),
              );
            },
            child: const Text('Retry'),
          ),
        ],
      );
}
