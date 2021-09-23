import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/home_screen.dart';

void main() {
  DeviceOrientation.portraitUp;
  DeviceOrientation.portraitDown;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech387 Tast 100',
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
