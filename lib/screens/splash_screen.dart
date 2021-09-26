import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech387task/Widgets/title_main.dart';

import '../screens/home_screen.dart';
import '../screens/AuthScreen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage('assets/images/mowee.png');
    var image = Image(
      image: assetsImage,
      fit: BoxFit.cover,
      height: 200,
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginAuth(context)),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      }
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: const LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Color(0xFFCCCCFF),
                Color(0xFF96DED1),
                Color(0XFFB6D0E2),
                Color(0XFFB6D0E2),
                Color(0XFFB6D0E2),
                Color(0xFF96DED1),
              ],
              stops: [
                0.0,
                0.3,
                0.3,
                0.7,
                0.7,
                1.0
              ]),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [image, TitleMain()],
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
