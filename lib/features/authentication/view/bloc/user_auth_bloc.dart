import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/register_response.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final RegisterUser _registerUser;

  UserAuthBloc({
    required RegisterUser registerUser,
  })  : _registerUser = registerUser,
        super(UserAuthInitial()) {
    on<UserAuthEvent>((_, emit) => emit(UserAuthLoading()));
    on<UserAuthRegisterUser>(_onUserAuthRegisterUser);
  }

  void _onUserAuthRegisterUser(
    UserAuthRegisterUser event,
    Emitter<UserAuthState> emit,
  ) async {
    final response = await _registerUser(
      RegisterUserParams(email: event.email, password: event.password),
    );

    response.fold(
      (error) => emit(UserAuthError(error)),
      (autResponse) => emit(UserAuthSuccess(autResponse)),
    );
  }
}
