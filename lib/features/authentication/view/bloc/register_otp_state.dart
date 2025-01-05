part of 'register_otp_bloc.dart';

@immutable
sealed class RegisterOtpState {}

final class RegisterOtpInitial extends RegisterOtpState {}

final class RegisterOtpLoading extends RegisterOtpState {}

final class RegisterOtpSuccess extends RegisterOtpState {
  final ModuleResponse moduleResponse;
  RegisterOtpSuccess(this.moduleResponse);
}

final class RegisterOtpError extends RegisterOtpState {
  final BloggiosException bloggiosException;
  RegisterOtpError(this.bloggiosException);
}
