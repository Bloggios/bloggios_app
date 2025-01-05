/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: bloggios_exception.dart
 */

class BloggiosException {
  final String message;
  final String code;

  BloggiosException({
    this.message = 'An Unexpected error occurred',
    this.code = 'UNKNOWN 500',
  });
}
