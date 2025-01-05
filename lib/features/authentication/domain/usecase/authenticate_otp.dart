/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: authenticate_otp
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/module_response.dart';
import 'package:bloggios_app/core/usecase/usecase.dart';
import 'package:bloggios_app/features/authentication/domain/repository/user_auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthenticateOtp
    implements Usecase<ModuleResponse, AuthenticateOtpParams> {
  final UserAuthRepository userAuthRepository;

  AuthenticateOtp(this.userAuthRepository);

  @override
  Future<Either<BloggiosException, ModuleResponse>> call(
      AuthenticateOtpParams params) async {
    return await userAuthRepository.authenticateOtp(
        email: params.email,
        otp: params.otp,
        userId: params.userId,
        password: params.password);
  }
}

class AuthenticateOtpParams {
  final String otp;
  final String email;
  final String password;
  final String userId;

  AuthenticateOtpParams({
    required this.otp,
    required this.email,
    required this.password,
    required this.userId,
  });
}
