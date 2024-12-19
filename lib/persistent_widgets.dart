import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection/base_data.dart';
import 'services/run_service.dart';

/// A button to enter settings, should be in actions[]
class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => IconButton(
        icon: const Icon(
          Icons.settings,
        ),
        onPressed: () async => Navigator.pushNamed(context, '/settings'),
      );
}

/// A button to increment, refresh, and view run data, should be in actions[]
class RunIncrementButton extends ConsumerWidget {
  const RunIncrementButton({
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final AsyncValue<List<PublicRun>> runs = ref.watch(runHandlerProvider);

    return switch (runs) {
      AsyncData<List<PublicRun>>(:final List<PublicRun> value) => Tooltip(
          richMessage: TextSpan(
            children: <InlineSpan>[
              TextSpan(text: 'Run #${value.last.id}:\n'),
              TextSpan(
                text: 'Began at: '
                    '${DateTime.fromMillisecondsSinceEpoch(value.last.time)}\n',
              ),
              if (value.last.driverName.isNotEmpty)
                TextSpan(text: 'Driver: ${value.last.driverName}\n'),
              if (value.last.locationName.isNotEmpty)
                TextSpan(text: 'Location: ${value.last.locationName}\n'),
              if (value.last.notes.isNotEmpty)
                TextSpan(text: 'Notes: ${value.last.notes}\n'),
            ],
          ),
          child: ElevatedButton(
            onPressed: () async {
              // show a snackbar when the run successfully increments
              await ref
                  .read(runHandlerProvider.notifier)
                  .incrementRun()
                  .then((final PublicRun value) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Incremented Run to ${value.id}!')),
                );
              });
            },
            child: const Text('Increment run'),
          ),
        ),
      AsyncError<Object?>(:final Object error) => Tooltip(
          message: error.toString(),
          // refresh when clicked
          // because the program has no global connection state
          child: TextButton(
            onPressed: () {
              ref.invalidate(runHandlerProvider);
            },
            child: const Text('Get run data'),
          ),
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}

/// A bottom sheet which shows latency and viewers
class BottomSysInfo extends ConsumerWidget {
  const BottomSysInfo({
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final AsyncValue<Map<String, NetFieldCapture<List<double>>>> caps =
        ref.watch(capModelHolderProvider);

    return switch (caps) {
      AsyncData<Map<String, NetFieldCapture<List<double>>>>(
        :final Map<String, NetFieldCapture<List<double>>> value
      ) =>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StreamBuilder<List<double>>(
              stream: value['Latency']?.getStream(),
              builder: (
                final BuildContext context,
                final AsyncSnapshot<List<double>> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('NONE');
                  case ConnectionState.waiting:
                    return const Text('WAITING');
                  case ConnectionState.active:
                    return Text('Latency: ${snapshot.data?.first} ms');
                  case ConnectionState.done:
                    return const Text('DONE');
                }
              },
            ),
            StreamBuilder<List<double>>(
              stream: value['Viewers']?.getStream(),
              builder: (
                final BuildContext context,
                final AsyncSnapshot<List<double>> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('NONE');
                  case ConnectionState.waiting:
                    return const Text('WAITING');
                  case ConnectionState.active:
                    return Text(
                      'Current Viewers: ${snapshot.data?.first.round()}',
                    );
                  case ConnectionState.done:
                    return const Text('DONE');
                }
              },
            ),
          ],
        ),
      AsyncError<Object>(:final Object error) => Text('ERROR: $error'),
      _ => const LinearProgressIndicator(),
    };
  }
}
