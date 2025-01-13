import 'package:bloc/bloc.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/models/profile_response.dart';
import 'package:bloggios_app/features/user_onboarding/usecase/add_profile.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final AddProfile _addProfile;

  ProfileBloc({
    required AddProfile addProfile,
  })  : _addProfile = addProfile,
        super(ProfileInitial()) {
    on<ProfileEvent>((_, emit) => emit(ProfileLoading()));
    on<ProfileAddProfile>(_onProfileAddProfile);
    on<ProfileUpdateProfileResponse>(_onProfileUpdateProfileResponse);
  }

  void _onProfileAddProfile(
      ProfileAddProfile event,
      Emitter<ProfileState> emit,
      ) async {
    final response = await _addProfile(
      AddProfileParams(firstName: event.firstName, lastName: event.lastName),
    );

    response.fold(
          (error) => emit(ProfileError(error)),
          (profileResponse) => emit(ProfileSuccess(profileResponse)),
    );
  }

  void _onProfileUpdateProfileResponse(
      ProfileUpdateProfileResponse event,
      Emitter<ProfileState> emit,
      ) async {
    emit(ProfileSuccess(event.profileResponse));
  }
}
