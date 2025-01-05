/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: user_auth_api
 */

import 'dart:convert';

import 'package:bloggios_app/core/constants/api_constants.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/auth_response.dart';
import 'package:bloggios_app/core/storage/secured_storage.dart';
import 'package:bloggios_app/core/utils/cookie_utils.dart';
import 'package:bloggios_app/features/authentication/data/api/auth_api.dart';
import 'package:bloggios_app/features/authentication/utils/client_utils.dart';
import 'package:http/http.dart' as http;

class AuthApiImplementation implements AuthApi {
  @override
  Future<AuthResponse> authenticateUser(
      {required String email, required String password}) async {
    final authenticate = ApiConstants.authenticate;
    Uri url = Uri.parse(authenticate.path);

    Map<String, String> data = {
      "entrypoint": email,
      "password": password,
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
        var cookies = response.headers['set-cookie'];
        if (cookies == null) throw BloggiosException();
        String refreshToken = CookieUtils.parseRefreshToken(cookies);
        if (refreshToken.isEmpty) throw BloggiosException();
        AuthResponse authResponse = AuthResponse(
          accessToken: responseData['accessToken'],
          userId: responseData['userId'],
          clientId: responseData['clientId'],
        );
        SecuredStorage.storeRefreshToken(refreshToken, authResponse);
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
  Future<AuthResponse> refreshToken() async {
    String? refreshToken = await SecuredStorage.retrieveRefreshToken();
    if (refreshToken == null) {
      throw BloggiosException(
          message: 'Not Refresh Token Present',
          code: 'REFRESH_TOKEN_NOT_FOUND');
    }
    final refreshTokenApi = ApiConstants.refreshToken;
    Uri url = Uri.parse(refreshTokenApi.path);
    final refreshTokenCookie = 'local-refresh-token__mgmt=$refreshToken';
    Map<String, String> headers = {'Cookie': refreshTokenCookie};

    try {
      final response = await http.get(url, headers: headers);
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == refreshTokenApi.successCode) {
        var cookies = response.headers['set-cookie'];
        if (cookies == null) throw BloggiosException();
        String refreshToken = CookieUtils.parseRefreshToken(cookies);
        if (refreshToken.isEmpty) throw BloggiosException();
        AuthResponse authResponse = AuthResponse(
          accessToken: responseData['accessToken'],
          userId: responseData['userId'],
          clientId: responseData['clientId'],
        );
        SecuredStorage.storeRefreshToken(refreshToken, authResponse);
        return authResponse;
      } else {
        throw BloggiosException(
            message: responseData['message'], code: responseData['code']);
      }
    } on BloggiosException catch (exception) {
      await SecuredStorage.deleteRefreshToken();
      throw BloggiosException(message: exception.message, code: exception.code);
    } catch (exception) {
      throw BloggiosException(
          message: 'Server Error', code: 'SOCKET_EXCEPTION');
    }
  }
}
