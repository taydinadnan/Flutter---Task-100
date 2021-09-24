import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech387task/constants.dart';
import 'package:tech387task/screens/home_screen.dart';
import 'package:tech387task/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage(
        'assets/images/logoMowe.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        fit: BoxFit.cover); //<- Creates a widget that displays an image.

    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xfF86B4CF),
      body: Center(child: Container(child: image)),
    );
  }
}
