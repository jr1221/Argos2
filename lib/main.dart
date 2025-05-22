import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'global_settings.dart';
import 'pages/graph/graph_page.dart';
import 'pages/main/argos_settings_page.dart';
import 'pages/main/car_command_page.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'pages/main/data_page.dart';
import 'pages/main/favorites_page.dart';
import 'pages/settings_page.dart';
import 'persistent_widgets.dart';
import 'services/dashboard_service.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class AdaptiveScaffoldDestination {
  final String label;
  final Icon icon;

  const AdaptiveScaffoldDestination({required this.label, required this.icon});
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
          // StatefulShellBranch(
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: '/cam',
          //       builder:
          //           (final BuildContext context, final GoRouterState state) =>
          //               const CameraPage(),
          //     ),
          //   ],
          // ),
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
                path: '/settings',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const SettingsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/argos_settings',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const ArgosSettingsPage(),
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
        path: '/graph',
        builder: (final BuildContext context, final GoRouterState state) =>
            const GraphPage(),
      ),
      GoRoute(
        path: '/topicsSelector',
        builder: (final BuildContext context, final GoRouterState state) =>
            const TopicsSelector(),
      ),
      GoRoute(
        path: '/dashboard/:dashName/view',
        builder: (final BuildContext context, final GoRouterState state) =>
            DashboardPage(
          dashName: state.pathParameters['dashName'] ?? '',
        ),
      ),
      GoRoute(
        path: '/dashboard/:dashName/edit',
        builder: (final BuildContext context, final GoRouterState state) =>
            DashEditorPage(
          dashName: state.pathParameters['dashName'] ?? '',
        ),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => MaterialApp.router(
        title: 'Cool',
        routerConfig: _router,
        shortcuts:
            Map<ShortcutActivator, Intent>.from(WidgetsApp.defaultShortcuts)
              ..addAll(<ShortcutActivator, Intent>{
                LogicalKeySet(LogicalKeyboardKey.select):
                    const ActivateIntent(),
                const SingleActivator(LogicalKeyboardKey.arrowDown):
                    const DirectionalFocusIntent(TraversalDirection.down),
                const SingleActivator(LogicalKeyboardKey.arrowUp):
                    const DismissIntent(),
                const SingleActivator(LogicalKeyboardKey.arrowLeft):
                    const PreviousFocusIntent(),
                const SingleActivator(LogicalKeyboardKey.arrowRight):
                    const NextFocusIntent(),
              }),
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

  static const List<AdaptiveScaffoldDestination> tabs =
      <AdaptiveScaffoldDestination>[
    AdaptiveScaffoldDestination(
      icon: Icon(Icons.data_exploration_outlined),
      label: 'Data',
    ),
    // NavigationDestination(
    //   icon: Icon(Icons.video_camera_front_outlined),
    //   label: 'Cam',
    // ),

    AdaptiveScaffoldDestination(
      icon: Icon(Icons.star_outlined),
      label: 'Favorites',
    ),
  ];
  static const List<AdaptiveScaffoldDestination> end_tabs =
      <AdaptiveScaffoldDestination>[
    AdaptiveScaffoldDestination(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
    AdaptiveScaffoldDestination(
      icon: Icon(Icons.handyman),
      label: 'Argos',
    ),
    AdaptiveScaffoldDestination(
      icon: Icon(Icons.construction),
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
    final List<String> dashes = ref.watch(availableDashboardsManagerProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hello World'),
        actions: <Widget>[
          const GraphFavoritesButton(),
          if (!useMqtt) const RunIncrementButton(),
          Builder(
            builder: (final BuildContext context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (final BuildContext context) => SimpleDialog(
              title: const Text('Add/Remove Dashboards'),
              children: <Widget>[
                const DashList(),
                const NewDashForm(),
                TextButton.icon(
                  onPressed: context.pop,
                  label: const Text('Exit'),
                  icon: const Icon(Icons.exit_to_app),
                )
              ],
            ),
          );
        },
        icon: const Icon(Icons.edit),
      ),
      body: navShell,
      drawer: NavigationDrawer(
        selectedIndex: navShell.currentIndex,
        onDestinationSelected: (final int index) {
          navShell.goBranch(index);
          context.pop(context);
        },
        children: tabs
            .map(
              (final AdaptiveScaffoldDestination d) =>
                  NavigationDrawerDestination(
                icon: d.icon,
                label: Text(d.label),
              ),
            )
            .toList(),
      ),
      endDrawer: NavigationDrawer(
        // if the current index is greater than the og tabs, show it
        selectedIndex: navShell.currentIndex - tabs.length,
        onDestinationSelected: (final int index) {
          navShell.goBranch(index + tabs.length);
          context.pop(context);
        },
        children: end_tabs
            .map(
              (final AdaptiveScaffoldDestination d) =>
                  NavigationDrawerDestination(
                icon: d.icon,
                label: Text(d.label),
              ),
            )
            .toList(),
      ),
      persistentFooterButtons: dashes
          .map(
            (final String dash) => TextButton(
              onPressed: () async {
                await context.push('/dashboard/$dash/view');
              },
              child: Text(dash),
            ),
          )
          .toList(),
      bottomSheet: useMqtt ? null : const BottomSysInfo(),
    );
  }
}

class DashList extends ConsumerWidget {
  const DashList({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final List<String> dashes = ref.watch(availableDashboardsManagerProvider);

    return Column(
      children: dashes
          .map(
            (final String d) => Row(
              children: <Widget>[
                Text(d),
                IconButton(
                  onPressed: () async {
                    await ref
                        .read(
                          availableDashboardsManagerProvider.notifier,
                        )
                        .removeDash(d);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class NewDashForm extends ConsumerStatefulWidget {
  const NewDashForm({
    super.key,
  });

  @override
  ConsumerState<NewDashForm> createState() => _NewDashFormState();
}

class _NewDashFormState extends ConsumerState<NewDashForm> {
  final GlobalKey<FormState> _uriFormKey = GlobalKey<FormState>();
  final TextEditingController _uriFormText = TextEditingController();

  @override
  void dispose() {
    _uriFormText.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Row(
        children: <Widget>[
          Form(
            key: _uriFormKey,
            child: Flexible(
              child: TextFormField(
                controller: _uriFormText,
                decoration: const InputDecoration(
                  icon: Icon(Icons.line_axis_sharp),
                  labelText: 'Dashboard name',
                ),
                onTapOutside: (final PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (final String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_uriFormKey.currentState!.validate()) {
                await ref
                    .read(availableDashboardsManagerProvider.notifier)
                    .addDash(_uriFormText.text);
                _uriFormText.text = '';
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
}
