/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: app_logger
 */

import 'package:logger/logger.dart';

class AppLogger {
  static late Logger _logger;

  static void init({bool isProduction = false}) {
    _logger = Logger(
      printer: isProduction
          ? SimplePrinter()
          : PrettyPrinter(),
      level: isProduction ? Level.warning : Level.debug,
    );
  }

  static void debug(String message) => _logger.d(message);
  static void info(String message) => _logger.i(message);
  static void warning(String message) => _logger.w(message);
  static void error(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}