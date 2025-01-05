import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/authenticate_user.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/refresh_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser _authenticateUser;
  final RefreshToken _refreshToken;

  AuthBloc({
    required AuthenticateUser authenticateUser,
    required RefreshToken refreshToken,
  })  : _authenticateUser = authenticateUser,
        _refreshToken = refreshToken,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthAuthenticateUser>(_onAuthAuthenticateUser);
    on<AuthRefreshToken>(_onAuthRefreshToken);
    on<AuthRefreshTokenUpdate>(_onAuthRefreshTokenSuccess);
  }

  void _onAuthAuthenticateUser(
    AuthAuthenticateUser event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _authenticateUser(
      AuthenticatedUserParams(email: event.email, password: event.password),
    );

    response.fold(
      (error) => emit(AuthError(error)),
      (autResponse) => emit(AuthSuccess(autResponse)),
    );
  }

  void _onAuthRefreshToken(
    AuthRefreshToken event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _refreshToken('');

    response.fold(
      (error) => emit(AuthError(error)),
      (autResponse) => emit(AuthSuccess(autResponse)),
    );
  }

  void _onAuthRefreshTokenSuccess(
      AuthRefreshTokenUpdate event, Emitter<AuthState> emit) {
    emit(AuthSuccess(event.authResponse));
  }
}
