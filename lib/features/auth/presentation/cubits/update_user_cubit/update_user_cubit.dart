import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_request.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this._authRepoImpl) : super(UpdateUserInitial());

  final AuthRepoImpl _authRepoImpl;

  final GlobalKey<FormState> updateUserKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController firstSkillController = TextEditingController();

  TextEditingController secondSkillController = TextEditingController();

  TextEditingController thirdSkillController = TextEditingController();

  TextEditingController fourthSkillController = TextEditingController();

  TextEditingController fifthSkillController = TextEditingController();

  TextEditingController emoji = TextEditingController();

  IconData suffix = Icons.visibility_outlined;

  bool isObscure = true;

  Future<void> updateUser(UpdateUserRequest request) async {
    emit(UpdateUserLoading());
    var result = await _authRepoImpl.updateUser(request);
    result.fold(
      (failure) {
        emit(UpdateUserFailure(failure.errMessage));
      },
      (response) {
        emit(UpdateUserSuccess(response.userData!));
      },
    );
  }

  Future<void> getUser() async {
    emit(GetUserLoading());
    var result = await _authRepoImpl.getUser();
    result.fold((failure) {
      emit(GetUserFailure(failure.errMessage));
    }, (response) {
      emit(GetUserSuccess(response.userData!));
    });
  }

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  void changePhone(PhoneNumber phoneNumber) {
    phoneController.text = phoneNumber.completeNumber;
    emit(PhoneChanged());
  }

  void changeCountry(Country country) {
    locationController.text = country.name;
    emoji.text = country.flagEmoji;
    emit(LocationChanged());
  }
}
