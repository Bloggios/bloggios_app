/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: authenticate_user.dart
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/core/usecase/usecase.dart';
import 'package:bloggios_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthenticateUser
    implements Usecase<AuthResponse, AuthenticatedUserParams> {
  final AuthRepository authRepository;

  AuthenticateUser(this.authRepository);

  @override
  Future<Either<BloggiosException, AuthResponse>> call(
      AuthenticatedUserParams params) async {
    return await authRepository.authenticateUser(
        email: params.email, password: params.password);
  }
}

class AuthenticatedUserParams {
  final String email;
  final String password;

  AuthenticatedUserParams({required this.email, required this.password});
}
