import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/core/usecase/usecase.dart';
import 'package:bloggios_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class RefreshToken implements Usecase<AuthResponse, String> {
  final AuthRepository authRepository;

  RefreshToken(this.authRepository);

  @override
  Future<Either<BloggiosException, AuthResponse>> call(String params) async {
    return await authRepository.refreshToken();
  }
}
