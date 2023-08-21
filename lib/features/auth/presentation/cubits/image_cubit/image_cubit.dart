import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  final ImagePicker _imagePicker = ImagePicker();

  var uuidGenerator = const Uuid();

  String? imageUrl;

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
      userImage = imageUrl;
      await CacheHelper.setData(key: 'userImage', value: imageUrl);
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
