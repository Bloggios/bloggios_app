/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: bloggios_exception.dart
 */

class BloggiosException implements Exception {
  final String message;
  final String code;

  BloggiosException({
    this.message = 'An Unexpected error occurred',
    this.code = 'UNKNOWN 500',
  });

  factory BloggiosException.fromJson(Map<String, dynamic> json) {
    return BloggiosException(
      message: json['message'] ?? 'An Unexpected error occurred',
      code: json['code'] ?? 'UNKNOWN 500',
    );
  }
}
