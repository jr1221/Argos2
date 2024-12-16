import 'package:argos2/pages/data_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CapModel(),
      child: MaterialApp(
      title: 'Cool',
      initialRoute: '/',
      routes: {
        '/': (context) => DataPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red, brightness: Brightness.dark),
        useMaterial3: true,
      ),
    ),);
  }
}
