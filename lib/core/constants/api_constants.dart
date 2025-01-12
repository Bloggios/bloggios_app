/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: api_constants.dart.dart
 */

import 'package:bloggios_app/core/constants/env_constants.dart';
import 'package:bloggios_app/core/models/api_info.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.get(EnvConstants.baseUrl);
  static String userAuthController = '$baseUrl/auth-service/user-auth';
  static String authController = '$baseUrl/auth-service/auth';
  static String profileController = '/profile-service';

  static ApiInfo authenticate = ApiInfo(
    '$authController/authenticate',
    202,
  );

  static ApiInfo refreshToken = ApiInfo(
    '${ApiConstants.authController}/refresh-token',
    202,
  );

  static ApiInfo registerUser = ApiInfo(
    '$userAuthController/register',
    200,
  );

  static ApiInfo authenticateOtp = ApiInfo(
    '$userAuthController/authenticate-otp',
    202,
  );

  static ApiInfo getProfile = ApiInfo(
    '/profile-service/profile',
    200,
  );
}
