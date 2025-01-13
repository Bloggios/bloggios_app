/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: add_profile
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/profile_response.dart';
import 'package:bloggios_app/core/rest/profile_controller.dart';
import 'package:bloggios_app/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

class AddProfile implements Usecase<ProfileResponse, AddProfileParams> {
  final ProfileController profileController;

  AddProfile(this.profileController);

  @override
  Future<Either<BloggiosException, ProfileResponse>> call(
      AddProfileParams params) async {
    try {
      final response = await profileController.addProfileInitial(params.firstName, params.lastName);
      return right(response);
    } on BloggiosException catch (exception) {
      return left(exception);
    }
  }
}

class AddProfileParams {
  final String firstName;
  final String? lastName;

  AddProfileParams({required this.firstName, this.lastName});
}
