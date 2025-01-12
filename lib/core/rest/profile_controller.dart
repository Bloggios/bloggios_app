/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: profile_controller
 */

import 'package:bloggios_app/core/constants/api_constants.dart';
import 'package:bloggios_app/core/constants/application_constants.dart';
import 'package:bloggios_app/core/dio/init_dio.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/api_info.dart';
import 'package:bloggios_app/core/models/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileController {
  Future<ProfileResponse> getProfile() async {
    final ApiInfo getProfile = ApiConstants.getProfile;

    try {
      final response = await bloggiosDio.get(getProfile.path);

      if (response.statusCode == getProfile.successCode) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return throw BloggiosException.fromJson(response.data);
      }
    } on DioException catch (dioException) {
      if (dioException.type == DioExceptionType.connectionTimeout ||
          dioException.type == DioExceptionType.receiveTimeout ||
          dioException.type == DioExceptionType.connectionError ||
          dioException.type == DioExceptionType.sendTimeout) {
        throw BloggiosException(
            message: 'Server Error',
            code: ApplicationConstants.timeoutException);
      } else if (dioException.type == DioExceptionType.badResponse) {
        throw BloggiosException.fromJson(dioException.response!.data);
      } else {
        print('Dio Exception');
        throw BloggiosException(
            message: 'Server Error',
            code: ApplicationConstants.socketException);
      }
    } catch (exception) {
      print('Exception');
      throw BloggiosException(
          message: 'Server Error', code: ApplicationConstants.socketException);
    }
  }
}
