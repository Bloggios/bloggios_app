part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileResponse profileResponse;
  ProfileSuccess(this.profileResponse);
}

final class ProfileError extends ProfileState {
  final BloggiosException bloggiosException;
  ProfileError(this.bloggiosException);
}