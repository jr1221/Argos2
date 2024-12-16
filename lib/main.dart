import 'package:argos2/pages/data_page.dart';
import 'package:argos2/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final val = await SharedPreferencesClass.restore('v1_BackendUri');
  runApp(MyApp(uri: val ?? 'http://192.168.0.82:8000',));
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
        '/': (context) => DataPage(),
        '/settings': (context) => SettingsPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red, brightness: Brightness.dark),
        useMaterial3: true,
      ),
    ),);
  }
}

class SharedPreferencesClass {
  static Future<Object?> restore(String key) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.get(key);
  }

  static save(String key, dynamic value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPrefs.setBool(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPrefs.setStringList(key, value);
    }
  }
}