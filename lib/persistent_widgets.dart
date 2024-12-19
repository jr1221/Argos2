import 'package:argos2/connection/base_data.dart';
import 'package:argos2/services/run_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.settings,
      ),
      onPressed: () => Navigator.pushNamed(context, '/settings'),
    );
  }
}

class RunIncrementButton extends ConsumerWidget {
  const RunIncrementButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<PublicRun>> runs = ref.watch(runHandlerProvider);

    return switch (runs) {
      AsyncData(:final value) => Tooltip(
          richMessage: TextSpan(children: [
            TextSpan(text: 'Run #${value.last.id}:\n'),
            TextSpan(
                text:
                    'Began at: ${DateTime.fromMillisecondsSinceEpoch(value.last.time)}\n'),
            if (value.last.driverName.isNotEmpty)
              TextSpan(text: 'Driver: ${value.last.driverName}\n'),
            if (value.last.locationName.isNotEmpty)
              TextSpan(text: 'Location: ${value.last.locationName}\n'),
            if (value.last.notes.isNotEmpty)
              TextSpan(text: 'Notes: ${value.last.notes}\n'),
          ]),
          child: ElevatedButton(
            onPressed: () async {
              ref
                  .read(runHandlerProvider.notifier)
                  .incrementRun()
                  .then((value) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Incremented Run to ${value.id}!')),
                );
              });
            },
            child: Text('Increment run'),
          ),
        ),
      AsyncError() => const Text('Server Offline'),
      _ => const CircularProgressIndicator(),
    };
  }
}

class BottomSysInfo extends ConsumerWidget {
  const BottomSysInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caps = ref.watch(capModelProvider);
    return switch (caps) {
      AsyncData(:final value) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder<List<double>>(
              stream: value['Latency']?.getStream(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
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
              stream: value['Viewers']?.getStream(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
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
        ),
      AsyncError(:final error) => Text('Oops $error'),
      _ => const CircularProgressIndicator(),
    };
  }
}
