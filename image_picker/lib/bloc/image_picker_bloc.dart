// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:image_picker_using_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_using_bloc/utils/image_picker_utils.dart';

import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtitls imagePickerUtitls;
  ImagePickerBloc({
   required this.imagePickerUtitls,
  }) : super(const ImagePickerState()) {
    on<CameraCaptureEvent>(cameraCaptureEvent);
    on<GalleryImagePickerEvent>(galleryImagePickerEvent);
  }

  FutureOr<void> cameraCaptureEvent(
    CameraCaptureEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? imageFile = await imagePickerUtitls.pickCameraImage();
    emit(ImagePickerState(file: imageFile));
  }

  FutureOr<void> galleryImagePickerEvent(
    GalleryImagePickerEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? imageFile = await imagePickerUtitls.pickGalleryImage();
    emit(ImagePickerState(file: imageFile));
  }
}
