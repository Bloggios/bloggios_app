/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: dimensions
 */

import 'package:flutter/material.dart';

class Dimensions {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double availableHeight(BuildContext context) =>
      screenHeight(context) -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
}
