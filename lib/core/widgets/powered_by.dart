/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: powered_by.dart
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'Powered by ',
        style:
            TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Nunito"),
        children: <TextSpan>[
          TextSpan(
            text: 'Bloggios',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppPallete.accentColor),
          ),
        ],
      ),
    );
  }
}
