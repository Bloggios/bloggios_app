/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: theme.java
 */

import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String fontFamily = "Inter";

  static final lightThemeMode = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppPallete.whiteColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.accentColor),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontFamily: fontFamily, color: Colors.black),
        displayMedium: TextStyle(fontFamily: fontFamily, color: Colors.black),
        displaySmall: TextStyle(fontFamily: fontFamily, color: Colors.black),
        headlineLarge: TextStyle(fontFamily: fontFamily, color: Colors.black),
        headlineMedium: TextStyle(fontFamily: fontFamily, color: Colors.black),
        headlineSmall: TextStyle(fontFamily: fontFamily, color: Colors.black),
        titleLarge: TextStyle(fontFamily: fontFamily, color: Colors.black),
        titleMedium: TextStyle(fontFamily: fontFamily, color: Colors.black),
        titleSmall: TextStyle(fontFamily: fontFamily, color: Colors.black),
        bodyLarge: TextStyle(fontFamily: fontFamily, color: Colors.black),
        bodyMedium: TextStyle(fontFamily: fontFamily, color: Colors.black),
        bodySmall: TextStyle(fontFamily: fontFamily, color: Colors.black),
        labelLarge: TextStyle(fontFamily: fontFamily, color: Colors.black),
        labelMedium: TextStyle(fontFamily: fontFamily, color: Colors.black),
        labelSmall: TextStyle(fontFamily: fontFamily, color: Colors.black),
      ));
}
