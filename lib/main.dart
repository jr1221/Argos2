import 'package:argos2/pages/car_command_page.dart';
import 'package:argos2/pages/data_page.dart';
import 'package:argos2/pages/settings_page.dart';
import 'package:argos2/persistent_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as river;

import 'global_settings.dart';

Future<void> main() async {
  runApp(
    river.ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends river.ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, river.WidgetRef ref) {
    ref.read(connectionControlProvider.notifier).init();
    return MaterialApp(
      title: 'Cool',
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreens(),
        '/settings': (context) => SettingsPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red, brightness: Brightness.dark),
        useMaterial3: true,
      ),
    );
  }
}

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return river.Consumer(
        builder: (BuildContext context, river.WidgetRef ref, child) {
      final ConnectionProps props = ref.watch(connectionControlProvider);
      print('context w/ ${props.uri}, MQTT: ${props.useMqtt}');
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Hello World'),
          actions: [
            if (!props.useMqtt) RunIncrementButton(),
            SettingsButton(),
          ],
        ),
        body: <Widget>[
          DataPage(),
          CarCommandPage(),
        ][currentPageIndex],
        bottomSheet: props.useMqtt ? null : BottomSysInfo(),
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.data_exploration_outlined), label: 'Data'),
              NavigationDestination(
                  icon: Icon(Icons.settings_remote_outlined), label: 'Commands')
            ]),
      );
    });
  }
}
