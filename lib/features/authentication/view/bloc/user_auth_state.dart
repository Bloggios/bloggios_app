part of 'user_auth_bloc.dart';

@immutable
sealed class UserAuthState {}

final class UserAuthInitial extends UserAuthState {}

final class UserAuthLoading extends UserAuthState {}

final class UserAuthSuccess extends UserAuthState {
  final RegisterResponse registerResponse;
  UserAuthSuccess(this.registerResponse);
}

final class UserAuthError extends UserAuthState {
  final BloggiosException bloggiosException;
  UserAuthError(this.bloggiosException);
}
