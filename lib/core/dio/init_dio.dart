import 'package:bloggios_app/core/dio/dio_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

final Dio bloggiosDio = Dio();

void initDio(GoRouter router) {
  final DioInterceptors dioInterceptors =
      DioInterceptors(dio: bloggiosDio, router: router);
  dioInterceptors.addRequestInterceptor();
}
