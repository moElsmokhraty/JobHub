import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_request.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepoImpl) : super(RegisterInitial());

  final AuthRepoImpl _authRepoImpl;

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

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

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await _authRepoImpl.register(request);
    result.fold((failure) {
      emit(RegisterFailure(failure.errMessage));
    }, (response) {
      emit(RegisterSuccess());
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
