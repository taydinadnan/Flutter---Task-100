import 'package:flutter/material.dart';

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
            onPressed: () {}, icon: Image.asset("assets/images/facebook.png")),
        IconButton(
            onPressed: () {}, icon: Image.asset("assets/images/google.png")),
      ],
    );
  }
}
