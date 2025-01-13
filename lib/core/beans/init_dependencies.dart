/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: init_dependencies
 */

import 'package:bloggios_app/core/exception/exception_code_service.dart';
import 'package:bloggios_app/core/rest/profile_controller.dart';
import 'package:bloggios_app/features/authentication/data/api/auth_api.dart';
import 'package:bloggios_app/features/authentication/data/api/implementation/auth_api_implementation.dart';
import 'package:bloggios_app/features/authentication/data/api/implementation/user_auth_api_implementation.dart';
import 'package:bloggios_app/features/authentication/data/api/user_auth_api.dart';
import 'package:bloggios_app/features/authentication/data/repository/auth_repository_implementation.dart';
import 'package:bloggios_app/features/authentication/data/repository/user_auth_repository_implementation.dart';
import 'package:bloggios_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:bloggios_app/features/authentication/domain/repository/user_auth_repository.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/authenticate_otp.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/authenticate_user.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/refresh_token.dart';
import 'package:bloggios_app/features/authentication/domain/usecase/register_user.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/register_otp_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/user_auth_bloc.dart';
import 'package:bloggios_app/features/user_onboarding/usecase/add_profile.dart';
import 'package:bloggios_app/features/user_onboarding/view/bloc/profile_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initSecuredStorage();
  _initRegisterOtp();
  _initUserAuth();
  _initAuth();
  _initExceptionCodes();
  _initProfileBloc();
}

void _initSecuredStorage() {
  serviceLocator.registerLazySingleton(
    () => FlutterSecureStorage(),
  );
}

void _initAuth() {
  serviceLocator.registerFactory<AuthApi>(
    () => AuthApiImplementation(),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImplementation(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => AuthenticateUser(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => RefreshToken(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      authenticateUser: serviceLocator(),
      refreshToken: serviceLocator(),
    ),
  );
}

void _initUserAuth() {
  serviceLocator.registerFactory<UserAuthApi>(
    () => UserAuthApiImplementation(),
  );
  serviceLocator.registerFactory<UserAuthRepository>(
    () => UserAuthRepositoryImplementation(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => RegisterUser(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UserAuthBloc(registerUser: serviceLocator()),
  );
}

void _initRegisterOtp() {
  serviceLocator.registerFactory(
    () => AuthenticateOtp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => RegisterOtpBloc(
      authenticateOtp: serviceLocator(),
    ),
  );
}

void _initExceptionCodes() {
  serviceLocator.registerLazySingleton<ExceptionCodeService>(
    () => ExceptionCodeService(),
  );
}

void _initProfileBloc() {
  serviceLocator.registerFactory<ProfileController>(
        () => ProfileController(),
  );

  serviceLocator.registerFactory(
        () => AddProfile(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
        () => ProfileBloc(
      addProfile: serviceLocator(),
    ),
  );
}
