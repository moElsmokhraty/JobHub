import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  MediaCubit() : super(ImageInitial());

  final ImagePicker _imagePicker = ImagePicker();

  var uuidGenerator = const Uuid();

  String? imageUrl;

  String? resumeUrl;

  List<PlatformUiSettings> settings = [
    AndroidUiSettings(
      toolbarTitle: 'Cropper',
      toolbarColor: Color(kLightBlue.value),
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.ratio4x3,
      lockAspectRatio: true,
    ),
    IOSUiSettings(
      title: 'Cropper',
      resetButtonHidden: false,
      rotateButtonsHidden: false,
      cancelButtonTitle: 'Cancel',
      doneButtonTitle: 'Done',
      aspectRatioLockEnabled: true,
    ),
  ];

  Future<void> pickUserImage() async {
    final XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (imageFile != null) {
      final XFile? croppedImage = await cropImage(imageFile);
      if (croppedImage != null) {
        await uploadUserImage(croppedImage);
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

  Future<void> uploadUserImage(XFile image) async {
    emit(ImageUploadLoading());
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('jobhub')
          .child('${uuidGenerator.v1()}.jpg');
      await ref.putFile(File(image.path));
      imageUrl = await ref.getDownloadURL();
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

  Future<void> pickJobImage() async {
    final XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (imageFile != null) {
      final XFile? croppedImage = await cropImage(imageFile);
      if (croppedImage != null) {
        await uploadJobImage(croppedImage);
      }
    }
  }

  Future<void> uploadJobImage(XFile image) async {
    emit(ImageUploadLoading());
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('jobhub')
          .child('${uuidGenerator.v1()}.jpg');
      await ref.putFile(File(image.path));
      imageUrl = await ref.getDownloadURL();
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

  Future<void> pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      await uploadResume(XFile(file.path!));
    }
  }

  Future<void> uploadResume(XFile resume) async {
    emit(ResumeUploadLoading());
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('jobhub')
          .child('${uuidGenerator.v1()}.pdf');
      await ref.putFile(File(resume.path));
      final resumeDownloadUrl = await ref.getDownloadURL();
      resumeUrl = resumeDownloadUrl;
      emit(ResumeUploadSuccess());
    } on FirebaseException catch (e) {
      emit(ResumeUploadFailure(e.message!));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(ResumeUploadFailure(ServerFailure.fromDioError(e).errMessage));
      } else {
        emit(ResumeUploadFailure(e.toString()));
      }
    }
  }
}
