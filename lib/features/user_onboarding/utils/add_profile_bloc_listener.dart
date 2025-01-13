/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: add_profile_bloc_listener
 */

import 'package:bloggios_app/core/exception/exception_provider.dart';
import 'package:bloggios_app/core/models/exception_info.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/features/user_onboarding/view/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';

void addProfileBlocListener(BuildContext context, ProfileState state) {
  if (state is ProfileLoading) {
    context.loaderOverlay.show(
      widgetBuilder: (_) => const SizedBox(),
    );
  } else if (state is ProfileSuccess) {
    context.loaderOverlay.hide();
    context.pushReplacement(Routes.matrimonyOnboardingPage.path);
  } else if (state is ProfileError) {
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
