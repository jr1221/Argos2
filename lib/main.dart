import 'package:argos2/pages/car_command_page.dart';
import 'package:argos2/pages/data_page.dart';
import 'package:argos2/pages/settings_page.dart';
import 'package:argos2/persistent_widgets.dart';
import 'package:argos2/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as river;
import 'package:provider/provider.dart';

import 'base_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final val = await SharedPreferencesClass.restore(BACKEND_URI_KEY);
  await SharedPreferencesClass.save(
      BACKEND_URI_KEY, val ?? BACKEND_URI_DEFAULT);
  runApp(
    river.ProviderScope(
      child: MyApp(
        uri: val ?? BACKEND_URI_DEFAULT,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final dynamic uri;
  const MyApp({super.key, required this.uri});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CapModel(uri),
      child: MaterialApp(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Hello World'),
        actions: [
          RunIncrementButton(),
          SettingsButton(),
        ],
      ),
      body: <Widget>[
        DataPage(),
        CarCommandPage(),
      ][currentPageIndex],
      bottomSheet: BottomSysInfo(),
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
  }
}
