/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: user_auth_api
 */

import 'package:bloggios_app/core/models/module_response.dart';
import 'package:bloggios_app/core/models/register_response.dart';

abstract interface class UserAuthApi {
  Future<RegisterResponse> registerUser({
    required String email,
    required String password,
  });

  Future<ModuleResponse> authenticateOtp({
    required String otp,
    required String userId,
    required String email,
    required String password,
  });
}
