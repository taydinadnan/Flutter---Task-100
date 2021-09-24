import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech387task/provider/auth_provider.dart';
import 'package:tech387task/screens/home_screen.dart';

class SocalButtns extends StatelessWidget {
  const SocalButtns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/facebook.png"),
        ),
        IconButton(
          onPressed: () {
            //Sign In with google
            AuthClass().signWithGoogle().then((UserCredential value) {
              final displayName = value.user!.displayName;

              print(displayName);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false);
            });
          },
          icon: Image.asset("assets/images/google.png"),
        ),
      ],
    );
  }
}
