part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageCropped extends ImageState {}

class ImageUploadLoading extends ImageState {}

class ImageUploadSuccess extends ImageState {}

class ImageUploadFailure extends ImageState {
  final String errMessage;

  ImageUploadFailure(this.errMessage);
}
