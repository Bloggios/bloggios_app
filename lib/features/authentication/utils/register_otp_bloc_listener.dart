/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: register_otp_bloc_listener
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/exception/exception_provider.dart';
import 'package:bloggios_app/core/models/exception_info.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/features/authentication/data/api/implementation/auth_api_implementation.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/register_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';

AuthBloc authBloc = serviceLocator<AuthBloc>();
final authApi = AuthApiImplementation();

void registerOtpBlocListener(
    BuildContext context, RegisterOtpState state) {
  if (state is RegisterOtpSuccess) {
    context.loaderOverlay.hide();
    context.pushReplacement(Routes.homePage.path);
  } else if (state is RegisterOtpLoading) {
    context.loaderOverlay.show();
  } else if (state is RegisterOtpError) {
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
