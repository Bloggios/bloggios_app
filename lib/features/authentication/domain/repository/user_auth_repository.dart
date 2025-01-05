/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: user_auth_repository.dart
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/module_response.dart';
import 'package:bloggios_app/core/models/register_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserAuthRepository {
  Future<Either<BloggiosException, RegisterResponse>> registerUser({
    required String email,
    required String password,
  });

  Future<Either<BloggiosException, ModuleResponse>> authenticateOtp({
    required String email,
    required String otp,
    required String userId,
    required String password,
  });
}
