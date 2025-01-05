/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: auth_repository_implementation.dart.dart
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/features/authentication/data/api/auth_api.dart';
import 'package:bloggios_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImplementation(this.authApi);

  @override
  Future<Either<BloggiosException, AuthResponse>> authenticateUser(
      {required String email, required String password}) async {
    try {
      final response =
          await authApi.authenticateUser(email: email, password: password);
      return right(response);
    } on BloggiosException catch (exception) {
      return left(exception);
    }
  }

  @override
  Future<Either<BloggiosException, AuthResponse>> refreshToken() async {
    try {
      final response = await authApi.refreshToken();
      return right(response);
    } on BloggiosException catch (exception) {
      return left(exception);
    }
  }
}
