part of 'user_auth_bloc.dart';

@immutable
sealed class UserAuthEvent {}

final class UserAuthRegisterUser extends UserAuthEvent {
  final String email;
  final String password;

  UserAuthRegisterUser({
    required this.email,
    required this.password,
  });
}
