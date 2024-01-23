import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
  @override
  List<Object?> get props => [];
}

final class CameraCaptureEvent extends ImagePickerEvent {}

final class GalleryImagePickerEvent extends ImagePickerEvent {}
