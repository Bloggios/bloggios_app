import 'package:bloggios_app/core/constants/env_constants.dart';
import 'package:bloggios_app/core/dio/dio_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

final Dio bloggiosDio = Dio(
  BaseOptions(
    baseUrl: dotenv.get(EnvConstants.baseUrl),
    connectTimeout: Duration(seconds: 40),
    receiveTimeout: Duration(seconds: 20),
  )
);

void initDio(GoRouter router) {
  final DioInterceptors dioInterceptors =
      DioInterceptors(dio: bloggiosDio, router: router);
  dioInterceptors.addRequestInterceptor();
}
