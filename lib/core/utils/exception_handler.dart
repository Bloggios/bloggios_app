/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: exception_handler
 */

import 'package:bloggios_app/core/constants/application_constants.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/utils/app_logger.dart';
import 'package:dio/dio.dart';

BloggiosException handleDioException(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      AppLogger.error("Message: Either of the connectionTimeout, receiveTimeout or sendTimeout Occurred", error: dioException);
      return generateBloggiosException(
        'Unable to connect to the server. Please try again later.',
        ApplicationConstants.timeoutException,
      );

    case DioExceptionType.connectionError:
      AppLogger.error('Message: Connection Error Occurred', error: dioException);
      return generateBloggiosException('Sever Unavailable', ApplicationConstants.socketException);

    case DioExceptionType.badResponse:
      AppLogger.error('Message: Bad Response Error Occurred', error: dioException);
      if (dioException.response?.data != null) {
        return BloggiosException.fromJson(dioException.response!.data);
      } else {
        return generateBloggiosException(
          'Unexpected server response',
          ApplicationConstants.unexpectedServerError,
        );
      }

    default:
      AppLogger.error('Message: Dio Exception: ${dioException.message}', error: dioException);
      return generateBloggiosException(
        'An unknown error occurred',
        ApplicationConstants.unexpectedServerError,
      );
  }
}

BloggiosException generateBloggiosException(String message, String code) {
  return BloggiosException(message: message, code: code);
}