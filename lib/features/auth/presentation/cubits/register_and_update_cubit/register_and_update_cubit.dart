import 'dart:io';
import 'package:dio/dio.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:uuid/uuid.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_request.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_request.dart';

part 'register_and_update_state.dart';

class RegisterAndUpdateCubit extends Cubit<RegisterAndUpdateState> {
  RegisterAndUpdateCubit(this._authRepoImpl)
      : super(RegisterAndUpdateInitial());

  final AuthRepoImpl _authRepoImpl;

  final GlobalKey<FormState> registerAndUpdateKey = GlobalKey<FormState>();

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

  final ImagePicker _imagePicker = ImagePicker();

  var uuidGenerator = const Uuid();

  String? imageUrl;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await _authRepoImpl.register(request);
    result.fold((failure) {
      emit(RegisterFailure(failure.errMessage));
    }, (response) {
      emit(RegisterSuccess());
    });
  }

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

  List<String> skills(List<String?> enteredSkills) {
    List<String> skills = [];
    for (int i = 0; i < enteredSkills.length; i++) {
      if (enteredSkills[i]!.isNotEmpty) {
        skills.add(enteredSkills[i]!);
      }
    }
    return skills;
  }

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterAndUpdateChangePasswordVisibility());
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

  Future<void> pickImage() async {
    final XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (imageFile != null) {
      final XFile? croppedImage = await cropImage(imageFile);
      if (croppedImage != null) {
        await CacheHelper.removeData(key: 'userImage');
        await imageUpload(croppedImage);
      }
    }
  }

  Future<XFile?> cropImage(XFile imageFile) async {
    final CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 1080,
      maxHeight: 1920,
      compressQuality: 100,
      aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
      uiSettings: settings,
    );

    if (croppedFile != null) {
      emit(ImageCropped());
      return XFile(croppedFile.path);
    }
    return null;
  }

  Future<void> imageUpload(XFile image) async {
    emit(ImageUploadLoading());
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('jobhub')
          .child('${uuidGenerator.v1()}.jpg');
      await ref.putFile(File(image.path));
      imageUrl = await ref.getDownloadURL();
      await CacheHelper.setData(key: 'userImage', value: imageUrl);
      userImage = await CacheHelper.getData(key: 'userImage');
      emit(ImageUploadSuccess());
    } on FirebaseException catch (e) {
      emit(ImageUploadFailure(e.message!));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(ImageUploadFailure(ServerFailure.fromDioError(e).errMessage));
      } else {
        emit(ImageUploadFailure(e.toString()));
      }
    }
  }
}
