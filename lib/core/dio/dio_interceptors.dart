import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/constants/env_constants.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/features/authentication/data/api/auth_api.dart';
import 'package:bloggios_app/features/authentication/data/api/implementation/auth_api_implementation.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

class DioInterceptors {
  final Dio dio;
  final GoRouter router;
  AuthBloc bloc = serviceLocator<AuthBloc>();
  static String refreshTokenName = dotenv.get(EnvConstants.refreshTokenName);

  DioInterceptors({required this.dio, required this.router});

  void addRequestInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final AuthState authState = bloc.state;
        final String? accessToken = (authState is AuthSuccess)
            ? authState.authResponse.accessToken
            : null;
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 403 &&
            error.response?.data['isExpired'] == true) {
          try {
            AuthApi authApi = AuthApiImplementation();
            AuthResponse authResponse = await authApi.refreshToken();

            if (authResponse.accessToken.isNotEmpty) {
              try {
                bloc.add(AuthRefreshTokenUpdate(authResponse));
                dio.options.headers['Authorization'] =
                    'Bearer ${authResponse.accessToken}';
                return handler.resolve(await dio.fetch(error.requestOptions));
              } on BloggiosException catch (refreshError) {
                router.go(Routes.authentication.path);
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    type: DioExceptionType.badResponse,
                    error: refreshError,
                  ),
                );
              } catch (exception) {
                router.go(Routes.serverUnavailable.path);
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    type: DioExceptionType.badResponse,
                    error: exception,
                  ),
                );
              }
            }
          } on BloggiosException catch (exception) {
            router.go(Routes.authentication.path);
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                response: error.response,
                type: DioExceptionType.badResponse,
                error: exception,
              ),
            );
          } catch (exception) {
            router.go(Routes.serverUnavailable.path);
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                response: error.response,
                type: DioExceptionType.badResponse,
                error: exception,
              ),
            );
          }
        }
        return handler.next(error);
      },
    ));
  }
}
