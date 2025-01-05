import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/module_response.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/authenticate_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_otp_event.dart';
part 'register_otp_state.dart';

class RegisterOtpBloc extends Bloc<RegisterOtpEvent, RegisterOtpState> {
  final AuthenticateOtp _authenticateOtp;

  RegisterOtpBloc({
    required AuthenticateOtp authenticateOtp,
  })  : _authenticateOtp = authenticateOtp,
        super(RegisterOtpInitial()) {
    on<RegisterOtpEvent>((_, emit) => emit(RegisterOtpLoading()));
    on<RegisterOtpAuthenticateOtp>(_onRegisterOtpAuthenticateOtp);
  }

  void _onRegisterOtpAuthenticateOtp(
    RegisterOtpAuthenticateOtp event,
    Emitter<RegisterOtpState> emit,
  ) async {
    final response = await _authenticateOtp(
      AuthenticateOtpParams(
        otp: event.otp,
        email: event.email,
        password: event.password,
        userId: event.userId,
      ),
    );

    response.fold(
      (error) => emit(RegisterOtpError(error)),
      (autResponse) => emit(RegisterOtpSuccess(autResponse)),
    );
  }
}
