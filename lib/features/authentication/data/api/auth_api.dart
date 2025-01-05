/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: user_auth_api
 */

import 'package:bloggios_app/core/models/auth_response.dart';

abstract interface class AuthApi {
  Future<AuthResponse> authenticateUser({
    required String email,
    required String password,
  });

  Future<AuthResponse> refreshToken();
}
