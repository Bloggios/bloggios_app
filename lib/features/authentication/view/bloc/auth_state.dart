part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthResponse authResponse;
  AuthSuccess(this.authResponse);
}

final class AuthError extends AuthState {
  final BloggiosException bloggiosException;
  AuthError(this.bloggiosException);
}
