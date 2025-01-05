/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: register_user
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/register_response.dart';
import 'package:bloggios_app/core/usecase/usecase.dart';
import 'package:bloggios_app/features/authentication/domain/repository/user_auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class RegisterUser implements Usecase<RegisterResponse, RegisterUserParams> {
  final UserAuthRepository userAuthRepository;

  RegisterUser(this.userAuthRepository);

  @override
  Future<Either<BloggiosException, RegisterResponse>> call(
      RegisterUserParams params) async {
    return await userAuthRepository.registerUser(
        email: params.email, password: params.password);
  }
}

class RegisterUserParams {
  final String email;
  final String password;

  RegisterUserParams({required this.email, required this.password});
}
