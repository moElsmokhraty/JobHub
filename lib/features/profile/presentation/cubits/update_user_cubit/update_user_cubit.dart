import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:job_hub/core/functions/extract_country_code.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/profile/data/repos/profile_repo/profile_repo_impl.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this._profileRepoImpl) : super(UpdateUserInitial());

  final ProfileRepoImpl _profileRepoImpl;

  final GlobalKey<FormState> updateUserKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController firstSkillController = TextEditingController();

  TextEditingController secondSkillController = TextEditingController();

  TextEditingController thirdSkillController = TextEditingController();

  TextEditingController fourthSkillController = TextEditingController();

  TextEditingController emoji = TextEditingController();

  Future<void> updateUser(UpdateUserRequest request) async {
    emit(UpdateUserLoading());
    var result = await _profileRepoImpl.updateUser(request);
    result.fold(
      (failure) {
        emit(UpdateUserFailure(failure.errMessage));
      },
      (response) {
        userImage = response.userData!.imageUrl!;
        emit(UpdateUserSuccess(response.userData!));
      },
    );
  }

  void changePhone(PhoneNumber phoneNumber) {
    phoneController.text = phoneNumber.number;
    emit(PhoneChanged());
  }

  void changeCountry(Country country) {
    locationController.text = country.name;
    emoji.text = country.flagEmoji;
    emit(LocationChanged());
  }

  void setValues(UserData userData, BuildContext context) {
    codeController.text = extractCountryCode(userData.phone!)[0];
    phoneController.text = extractCountryCode(userData.phone!)[1];
    BlocProvider.of<MediaCubit>(context).imageUrl = userData.imageUrl!;
    BlocProvider.of<MediaCubit>(context).resumeUrl = userData.resumeUrl!;
    locationController.text = userData.location!;
    firstSkillController.text = userData.skills![0];
    secondSkillController.text = userData.skills![1];
    thirdSkillController.text = userData.skills![2];
    fourthSkillController.text = userData.skills![3];
  }
}
