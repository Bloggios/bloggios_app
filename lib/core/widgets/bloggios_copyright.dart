/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: bloggios_copyright
 */

import 'package:flutter/material.dart';

class BloggiosCopyright extends StatelessWidget {
  final Color color;

  const BloggiosCopyright({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.clip,
      text: TextSpan(
        text: 'Copyright © 2025 ',
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Bloggios',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }
}
