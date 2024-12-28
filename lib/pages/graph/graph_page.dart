import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../global_settings.dart';
import '../../services/datatype_service.dart';
import '../../services/run_service.dart';
import 'graph_historical_page.dart';
import 'graph_live_page.dart';

class GraphPage extends ConsumerStatefulWidget {
  const GraphPage({super.key});

  @override
  ConsumerState<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends ConsumerState<GraphPage> {
  bool isLive = true;
  int resetKey = 0;

  @override
  Widget build(final BuildContext context) {
    // check whether we are in MQTT mode, as no historical view in MQTT mode
    final bool isMqtt = ref.watch(
      connectionControlProvider
          .select((final ConnectionProps it) => it.useMqtt),
    );

    // get some runs
    final List<PublicRun> runs =
        ref.watch(runHandlerProvider).value ?? <PublicRun>[];

    final int currentRun = ref.watch(historicalGraphRunManagerProvider);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              await context.push('/topicsSelector');
            },
            child: const Text('Select Topics'),
          ),
          const SizedBox(
            width: 20.0,
          ),
          DropdownMenu<int>(
            enabled: !isLive,
            label: const Text('Select Run'),
            initialSelection: currentRun,
            onSelected: (final int? id) {
              setState(() {
                ref
                    .read(historicalGraphRunManagerProvider.notifier)
                    .setRunId(id ?? currentRun);
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
          ? GraphLiveMgr(key: ValueKey<int>(resetKey))
          : GraphHistorical(key: ValueKey<int>(resetKey)),
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

class TopicsSelector extends ConsumerStatefulWidget {
  const TopicsSelector({
    super.key,
  });

  @override
  ConsumerState<TopicsSelector> createState() => _TopicsSelectorState();
}

class _TopicsSelectorState extends ConsumerState<TopicsSelector> {
  @override
  Widget build(final BuildContext context) {
    final HashSet<PublicDataType> selectedTopics =
        ref.watch(graphTopicsManagerProvider);
    final List<PublicDataType>? availTopics =
        ref.watch(getDataTypesProvider).value;
    return Scaffold(
      appBar: AppBar(),
      body: MultiDropdown<PublicDataType>(
        key: UniqueKey(),
        autovalidateMode: AutovalidateMode.onUnfocus,
        searchEnabled: true,
        onSelectionChange: (final List<PublicDataType> items) {
          ref.read(graphTopicsManagerProvider.notifier).setTopics(items);
        },
        items: availTopics
                ?.map(
                  (final PublicDataType e) => DropdownItem<PublicDataType>(
                    selected: selectedTopics.contains(e),
                    label: e.name,
                    value: e,
                  ),
                )
                .toList() ??
            <DropdownItem<PublicDataType>>[],
        chipDecoration: ChipDecoration(
          backgroundColor: Theme.of(context).highlightColor,
        ),
        dropdownDecoration: DropdownDecoration(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
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
        validator: (final List<DropdownItem<PublicDataType>>? value) {
          if (value == null || value.isEmpty) {
            return 'Please select one or more topics';
          }
          return null;
        },
      ),
    );
  }
}
