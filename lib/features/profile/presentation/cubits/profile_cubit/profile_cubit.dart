import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/profile/data/repos/profile_repo/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepoImpl) : super(ProfileInitial());

  final ProfileRepoImpl _profileRepoImpl;

  Future<void> getUser() async {
    emit(GetUserLoading());
    var result = await _profileRepoImpl.getUser();
    result.fold((failure) {
      emit(GetUserFailure(failure.errMessage));
    }, (response) {
      emit(GetUserSuccess(response.userData!));
    });
  }
}
