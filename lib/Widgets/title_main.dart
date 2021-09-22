import 'package:flutter/material.dart';

@override
// ignore: non_constant_identifier_names
Widget TitleMain() {
  return RichText(
    textAlign: TextAlign.justify,
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'Möwe',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ),
        TextSpan(
          text: 'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ],
    ),
  );
}
