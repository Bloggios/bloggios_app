/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: dio_util
 */

import 'package:bloggios_app/core/constants/application_constants.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/api_info.dart';
import 'package:bloggios_app/core/utils/app_logger.dart';
import 'package:bloggios_app/core/utils/exception_handler.dart';
import 'package:dio/dio.dart';

Future<T> initApi<T>(
    Future<Response> Function() apiCall,
    T Function(Map<String, dynamic>) fromJson,
    ApiInfo path
    ) async {
  try {
    final response = await apiCall();

    if (response.statusCode == path.successCode) {
      return fromJson(response.data);
    } else {
      AppLogger.error('Message: Response Code is not matched with the success code, expectedCode=${path.successCode}, receivedCode=${response.statusCode}, apiPath=${path.path}, responseBody=${response.data}');
      throw BloggiosException.fromJson(response.data);
    }
  } on DioException catch (dioException) {
    throw handleDioException(dioException);
  } catch (exception) {
    throw generateBloggiosException(
      'Something went wrong. Please try again later.',
      ApplicationConstants.unexpectedServerError,
    );
  }
}

