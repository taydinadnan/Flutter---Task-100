import 'package:flutter/material.dart';

class UserSocalButtns extends StatelessWidget {
  const UserSocalButtns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/fb.png"),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/linkedin.png"),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/twitter.png"),
          color: Colors.black,
        ),
      ],
    );
  }
}
