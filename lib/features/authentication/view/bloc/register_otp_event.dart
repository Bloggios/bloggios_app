part of 'register_otp_bloc.dart';

@immutable
sealed class RegisterOtpEvent {}

final class RegisterOtpAuthenticateOtp extends RegisterOtpEvent {
  final String email;
  final String password;
  final String otp;
  final String userId;

  RegisterOtpAuthenticateOtp({
    required this.email,
    required this.password,
    required this.otp,
    required this.userId,
  });
}
