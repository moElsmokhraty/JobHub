part of 'media_cubit.dart';

@immutable
abstract class MediaState {}

class ImageInitial extends MediaState {}

class ImageCropped extends MediaState {}

class ImageUploadLoading extends MediaState {}

class ImageUploadSuccess extends MediaState {}

class ImageUploadFailure extends MediaState {
  final String errMessage;

  ImageUploadFailure(this.errMessage);
}

class ResumeUploadLoading extends MediaState {}

class ResumeUploadSuccess extends MediaState {}

class ResumeUploadFailure extends MediaState {
  final String errMessage;

  ResumeUploadFailure(this.errMessage);
}
