import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<BloggiosException, AuthResponse>> authenticateUser(
      {required String email, required String password});

  Future<Either<BloggiosException, AuthResponse>> refreshToken();
}
