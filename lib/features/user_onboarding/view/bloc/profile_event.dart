part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileAddProfile extends ProfileEvent {
  final String firstName;
  final String? lastName;

  ProfileAddProfile(this.firstName, this.lastName);
}

final class ProfileUpdateProfileResponse extends ProfileEvent {
  final ProfileResponse profileResponse;

  ProfileUpdateProfileResponse(this.profileResponse);
}