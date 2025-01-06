/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: login_page_bloc_listener
 */

import 'package:bloggios_app/core/exception/exception_provider.dart';
import 'package:bloggios_app/core/models/exception_info.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';

void loginPageBlocListener(BuildContext context, AuthState state) {
  if (state is AuthLoading) {
    context.loaderOverlay.show(
      widgetBuilder: (_) => const SizedBox(),
    );
  } else if (state is AuthSuccess) {
    context.loaderOverlay.hide();
    context.pushReplacement(Routes.homePage.path);
  } else if (state is AuthError) {
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
