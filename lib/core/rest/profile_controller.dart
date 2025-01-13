/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: profile_controller
 */

import 'package:bloggios_app/core/constants/api_constants.dart';
import 'package:bloggios_app/core/dio/init_dio.dart';
import 'package:bloggios_app/core/models/api_info.dart';
import 'package:bloggios_app/core/models/profile_response.dart';
import 'package:bloggios_app/core/utils/dio_util.dart';
import 'package:dio/dio.dart';

class ProfileController {
  Future<ProfileResponse> getProfile() async {
    final ApiInfo getProfile = ApiConstants.getProfile;

    return await initApi(
      () => bloggiosDio.get(getProfile.path),
      (data) => ProfileResponse.fromJson(data),
      getProfile,
    );
  }

  Future<ProfileResponse> addProfileInitial(
      String firstName, String? lastName) async {
    final ApiInfo addProfile = ApiConstants.addProfile;
    final Map<String, dynamic> requestBody = {
      "firstName": firstName,
      if (lastName != null) "lastName": lastName,
    };

    return await initApi(
      () => bloggiosDio.post(
        addProfile.path,
        data: requestBody,
        options: Options(headers: {'Content-Type': 'application/json'}),
      ),
      (data) => ProfileResponse.fromJson(data),
      addProfile,
    );
  }
}
