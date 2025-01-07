/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: get_user_auth_state
 */

import 'package:bloggios_app/core/models/register_response.dart';
import 'package:bloggios_app/features/authentication/view/bloc/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

RegisterResponse getUserAuthState(BuildContext context) {
  UserAuthState state = context.read<UserAuthBloc>().state;
  if (state is UserAuthSuccess) {
    return state.registerResponse;
  }
  return RegisterResponse(email: '', password: '', message: '', userId: '');
}