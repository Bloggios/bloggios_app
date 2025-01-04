/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: text_divider.dart
 */

import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextDivider(
      {super.key,
      required this.text,
      this.color = Colors.grey,
      this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: fontSize),
          ),
        ),
        Expanded(child: Divider())
      ],
    );
  }
}
