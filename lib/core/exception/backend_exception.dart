/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: backend_exception.dart
 */

class BackendException implements Exception {
  final String message;

  const BackendException(this.message);
}
