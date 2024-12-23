import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global_settings.dart';
import 'pages/car_command_page.dart';
import 'pages/data_page.dart';
import 'pages/favorites_page.dart';
import 'pages/settings_page.dart';
import 'persistent_widgets.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => MaterialApp(
        title: 'Cool',
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (final BuildContext context) => const MainScreens(),
          '/settings': (final BuildContext context) => const SettingsPage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFEF4345),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
      );
}

class MainScreens extends ConsumerStatefulWidget {
  const MainScreens({super.key});

  @override
  ConsumerState<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends ConsumerState<MainScreens> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final bool useMqtt = ref.watch(
      connectionControlProvider
          .select((final ConnectionProps it) => it.useMqtt),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hello World'),
        actions: <Widget>[
          if (!useMqtt) const RunIncrementButton(),
          const SettingsButton(),
        ],
      ),
      body: <Widget>[
        const DataPage(),
        const FavoritesPage(),
        const CarCommandPage(),
      ][currentPageIndex],
      bottomSheet: useMqtt ? null : const BottomSysInfo(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (final int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.data_exploration_outlined),
            label: 'Data',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outlined),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_remote_outlined),
            label: 'Commands',
          ),
        ],
      ),
    );
  }
}
