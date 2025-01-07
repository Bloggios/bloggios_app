/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: signup_page_bloc_listener
 */

import 'package:bloggios_app/core/exception/exception_provider.dart';
import 'package:bloggios_app/core/models/exception_info.dart';
import 'package:bloggios_app/core/models/register_response.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/core/utils/dimensions.dart';
import 'package:bloggios_app/features/authentication/view/bloc/user_auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/widgets/register_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';

void signUpPageBlocListener(BuildContext context, UserAuthState state) {
  if (state is UserAuthLoading) {
    context.loaderOverlay.show(
      widgetBuilder: (_) => const SizedBox(),
    );
  } else if (state is UserAuthSuccess) {
    context.loaderOverlay.hide();
    _otpModal(context);
  } else if (state is UserAuthError) {
    context.loaderOverlay.hide();
    ExceptionInfo info = ExceptionProvider.getInfo(state.bloggiosException);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: info.title,
      text: info.message,
      confirmBtnColor: AppPallete.accentColor,
    );
  }
}

void _otpModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    elevation: 4,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    constraints: BoxConstraints(minWidth: double.infinity, maxHeight: Dimensions.availableHeight(context) * 0.9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return const RegisterOtp();
    },
  );
}

RegisterResponse getState(BuildContext context) {
  UserAuthState state = context.read<UserAuthBloc>().state;
  if (state is UserAuthSuccess) {
    return state.registerResponse;
  }
  return RegisterResponse(email: '', password: '', message: '', userId: '');
}