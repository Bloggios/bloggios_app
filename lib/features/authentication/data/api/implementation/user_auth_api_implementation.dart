/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: user_auth_api_implementation
 */

import 'dart:convert';

import 'package:bloggios_app/core/constants/api_constants.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/api_info.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/core/models/module_response.dart';
import 'package:bloggios_app/core/models/register_response.dart';
import 'package:bloggios_app/features/authentication/data/api/auth_api.dart';
import 'package:bloggios_app/features/authentication/data/api/implementation/auth_api_implementation.dart';
import 'package:bloggios_app/features/authentication/data/api/user_auth_api.dart';
import 'package:bloggios_app/features/authentication/utils/client_utils.dart';
import 'package:http/http.dart' as http;

class UserAuthApiImplementation implements UserAuthApi {
  @override
  Future<RegisterResponse> registerUser(
      {required String email, required String password}) async {
    ApiInfo registerUser = ApiConstants.registerUser;
    Uri url = Uri.parse(registerUser.path);

    try {
      AuthResponse authResponse = await authenticateClient();

      final body = jsonEncode({
        "email": email,
        "password": password,
      });

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authResponse.accessToken}',
      };

      try {
        final response = await http.post(
          url,
          headers: headers,
          body: body,
        );

        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (response.statusCode == registerUser.successCode) {
          RegisterResponse registerResponse = RegisterResponse(
              message: responseData['message'],
              userId: responseData['userId'],
              email: email,
              password: password);

          return registerResponse;
        } else {
          throw BloggiosException(
              message: responseData['message'], code: responseData['code']);
        }
      } on BloggiosException catch (exception) {
        throw BloggiosException(
            message: exception.message, code: exception.code);
      } catch (exception) {
        throw BloggiosException();
      }
    } on BloggiosException catch (exception) {
      throw BloggiosException(message: exception.message, code: exception.code);
    } catch (exception) {
      throw BloggiosException(
          message: 'Server Error', code: 'SOCKET_EXCEPTION'
      );
    }
  }

  Future<AuthResponse> authenticateClient() async {
    final authenticate = ApiConstants.authenticate;
    Uri url = Uri.parse(authenticate.path);
    Map<String, String> data = {
      "clientId": ClientDetails.getClientId(),
      "clientSecret": ClientDetails.getClientSecret()
    };

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    String encodedData = data.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value).replaceAll('%40', '@')}')
        .join('&');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: encodedData,
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == authenticate.successCode) {
        AuthResponse authResponse = AuthResponse(
          accessToken: responseData['accessToken'],
          clientId: responseData['clientId'],
        );

        return authResponse;
      } else {
        throw BloggiosException(
            message: responseData['message'], code: responseData['code']);
      }
    } on BloggiosException catch (exception) {
      throw BloggiosException(message: exception.message, code: exception.code);
    } catch (exception) {
      throw BloggiosException(
          message: 'Server Error', code: 'SOCKET_EXCEPTION'
      );
    }
  }

  @override
  Future<ModuleResponse> authenticateOtp(
      {required String otp,
      required String userId,
      required String email,
      required String password}) async {
    ApiInfo authenticateOtp = ApiConstants.authenticateOtp;
    Uri url = Uri.parse(authenticateOtp.path);

    try {
      final AuthResponse authResponse = await authenticateClient();
      if (authResponse.accessToken.isEmpty) {
        throw BloggiosException(message: 'Access token is missing');
      }

      Map<String, String> data = {
        "userId": userId,
        "otp": otp,
      };

      Map<String, String> headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${authResponse.accessToken}',
      };

      final String encodedData = data.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

      try {
        final response = await http
            .post(
              url,
              headers: headers,
              body: encodedData,
            )
            .timeout(Duration(seconds: 40));

        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (response.statusCode == authenticateOtp.successCode) {
          AuthApi authApi = AuthApiImplementation();
          await authApi.authenticateUser(email: email, password: password);
          ModuleResponse moduleResponse = ModuleResponse(
            userId: responseData['userId'],
            message: responseData['message'],
          );
          return moduleResponse;
        } else {
          throw BloggiosException(
              message: responseData['message'], code: responseData['code']);
        }
      } on BloggiosException catch (exception) {
        throw BloggiosException(
            message: exception.message, code: exception.code);
      } catch (exception) {
        throw BloggiosException();
      }
    } on BloggiosException catch (exception) {
      throw BloggiosException(message: exception.message, code: exception.code);
    } catch (exception) {
      throw BloggiosException(
          message: 'Server Error', code: 'SOCKET_EXCEPTION'
      );
    }
  }
}
