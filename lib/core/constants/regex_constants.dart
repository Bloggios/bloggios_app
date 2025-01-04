/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: regex_constants
 */

class RegexConstants {
  static final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  static RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
}