/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: splash_logics
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/constants/application_constants.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/storage/secured_storage.dart';
import 'package:bloggios_app/features/authentication/data/api/implementation/auth_api_implementation.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';

Future<String> initSplashLogics() async {
  final authApi = AuthApiImplementation();
  final authBloc = serviceLocator<AuthBloc>();
  //await SecuredStorage.deleteIsOnboardingVisited();
  final isOnboardingVisited = await SecuredStorage.retrieveIsOnboardingVisited();
  final refreshToken = await SecuredStorage.retrieveRefreshToken();
  if (isOnboardingVisited != null && isOnboardingVisited == 'true') {
    if (refreshToken != null) {
      try {
        AuthResponse authResponse = await authApi.refreshToken();
        authBloc.add(AuthRefreshTokenUpdate(authResponse));
        return Routes.homePage.path;
      } on BloggiosException catch (exception) {
        if (exception.code == ApplicationConstants.socketException) {
          return Routes.serverUnavailable.path;
        } else {
          return Routes.authentication.path;
        }
      } catch (exception) {
        return Routes.serverUnavailable.path;
      }
    } else {
      return Routes.authentication.path;
    }
  } else {
    if (refreshToken != null) {
      try {
        AuthResponse authResponse = await authApi.refreshToken();
        authBloc.add(AuthRefreshTokenUpdate(authResponse));
      } on BloggiosException catch (exception) {
        if (exception.code == ApplicationConstants.socketException) {
          return Routes.serverUnavailable.path;
        }
      } catch (exception) {
        return Routes.serverUnavailable.path;
      }
    }
    return Routes.onboarding.path;
  }
}