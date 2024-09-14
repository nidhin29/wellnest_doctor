
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Profile/model.dart';
import 'package:wellnest_doctor/Domain/Profile/profile_model.dart';
import 'package:wellnest_doctor/Domain/Profile/profile_service.dart';
import 'package:wellnest_doctor/Domain/TokenManager/token_service.dart';


part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService profileService;
  final TokenService tokenService;
  ProfileCubit(this.profileService, this.tokenService)
      : super(ProfileState.initial());

  getProfile() async {
    emit(state.copyWith(
        isLoading: true, isFailureOrSuccessForGet: none(), profileModel: null));
    final response = await profileService.getProfile();
    response.fold(
      (failure) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForGet: some(
              left(failure),
            )));
      },
      (profileModel) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForGet: some(right(profileModel)),
            profileModel: profileModel));
      },
    );
  }

  deleteEmail() {
    tokenService.deleteEmail();
  }

  updateProfile({required ProfileModel profileModel}) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccessForUpdate: none()));
    final response =
        await profileService.updateProfile(profileModel: profileModel);
    response.fold(
      (f) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForUpdate: some(
              left(f),
            )));
      },
      (r) {
        emit(state.copyWith(
          isLoading: false,
          isFailureOrSuccessForUpdate: some(right(r)),
        ));
      },
    );
  }
}
