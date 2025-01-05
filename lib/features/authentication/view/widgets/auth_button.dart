/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: auth_button
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  const AuthButton({super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.accentColor,
          minimumSize: const Size(double.infinity, 47),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          disabledBackgroundColor: AppPallete.accentColor.withOpacity(0.7)),
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
