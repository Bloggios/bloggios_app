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
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.onPress,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.accentColor,
        minimumSize: const Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        disabledBackgroundColor: AppPallete.accentColor.withOpacity(0.7),
      ),
      onPressed: onPress,
      child: isLoading
          ? const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
          : const Text(
        'Login',
        style: TextStyle(
          fontFamily: 'Inter',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
