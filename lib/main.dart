import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech387task/screens/login_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.light,
      home: LoginScreen(),
    );
  }
}
