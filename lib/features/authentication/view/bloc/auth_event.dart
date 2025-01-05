part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthAuthenticateUser extends AuthEvent {
  final String email;
  final String password;

  AuthAuthenticateUser({required this.email, required this.password});
}

final class AuthRefreshToken extends AuthEvent {}

final class AuthRefreshTokenUpdate extends AuthEvent {
  final AuthResponse authResponse;

  AuthRefreshTokenUpdate(this.authResponse);
}
