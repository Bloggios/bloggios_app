/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: auth_validators
 */

import 'package:bloggios_app/core/constants/regex_constants.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!RegexConstants.emailRegex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validateEntrypoint(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email or Username is required';
  }
  if (value.contains('@') && !RegexConstants.emailRegex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (!RegexConstants.passwordRegex.hasMatch(value)) {
    return 'Password must be at least 8 characters long,\n'
        'contain at least one uppercase letter,\n'
        'one lowercase letter, one number,\n'
        'and one special character.';
  }
  return null;
}