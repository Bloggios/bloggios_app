/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: init_snackbar.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void initSnackBar(BuildContext buildContext, String message) {
  HapticFeedback.selectionClick();
  ScaffoldMessenger.of(buildContext)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
      ),
    );
}
