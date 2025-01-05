/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: user_auth_repository_implementation
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/module_response.dart';
import 'package:bloggios_app/core/models/register_response.dart';
import 'package:bloggios_app/features/authentication/data/api/user_auth_api.dart';
import 'package:bloggios_app/features/authentication/domain/repository/user_auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserAuthRepositoryImplementation implements UserAuthRepository {
  final UserAuthApi userAuthApi;

  UserAuthRepositoryImplementation(this.userAuthApi);

  @override
  Future<Either<BloggiosException, RegisterResponse>> registerUser(
      {required String email, required String password}) async {
    try {
      final response =
          await userAuthApi.registerUser(email: email, password: password);
      return right(response);
    } on BloggiosException catch (exception) {
      return left(exception);
    }
  }

  @override
  Future<Either<BloggiosException, ModuleResponse>> authenticateOtp(
      {required String email,
      required String otp,
      required String userId,
      required String password}) async {
    try {
      final response = await userAuthApi.authenticateOtp(
          email: email, otp: otp, userId: userId, password: password);
      return right(response);
    } on BloggiosException catch (exception) {
      return left(exception);
    } catch (exception) {
      return left(BloggiosException(message: exception.toString()));
    }
  }
}
