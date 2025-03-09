import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'global_settings.dart';
import 'pages/graph/graph_page.dart';
import 'pages/main/camera_page.dart';
import 'pages/main/car_command_page.dart';
import 'pages/main/data_page.dart';
import 'pages/main/favorites_page.dart';
import 'pages/settings_page.dart';
import 'persistent_widgets.dart';


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (
          final BuildContext context,
          final GoRouterState state,
          final StatefulNavigationShell navigationShell,
        ) =>
            MainScreens(navShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const DataPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/cam',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const CameraPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/favorites',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const FavoritesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/command',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const CarCommandPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (final BuildContext context, final GoRouterState state) =>
            const SettingsPage(),
      ),
      GoRoute(
        path: '/graph',
        builder: (final BuildContext context, final GoRouterState state) =>
            const GraphPage(),
      ),
      GoRoute(
        path: '/topicsSelector',
        builder: (final BuildContext context, final GoRouterState state) =>
            const TopicsSelector(),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => MaterialApp.router(
        title: 'Cool',
        routerConfig: _router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFEF4345),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
      );
}

class MainScreens extends ConsumerWidget {
  final StatefulNavigationShell navShell;

  static const List<BottomNavigationBarItem> tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.data_exploration_outlined),
      label: 'Data',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_camera_front_outlined),
      label: 'Cam',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star_outlined),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_remote_outlined),
      label: 'Commands',
    ),
  ];

  const MainScreens({required this.navShell, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final bool useMqtt = ref.watch(
      connectionControlProvider
          .select((final ConnectionProps it) => it.useMqtt),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hello World'),
        actions: <Widget>[
          const GraphFavoritesButton(),
          if (!useMqtt) const RunIncrementButton(),
          const SettingsButton(),
        ],
      ),
      body: navShell,
      bottomSheet: useMqtt ? null : const BottomSysInfo(),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        currentIndex: navShell.currentIndex,
        onTap: navShell.goBranch,
        items: tabs,
      ),
    );
  }
}
