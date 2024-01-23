import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_event.dart';

import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerState()) {
    on<CameraCaptureEvent>(cameraCaptureEvent);
  }

  FutureOr<void> cameraCaptureEvent(
    CameraCaptureEvent event,
    Emitter<ImagePickerState> emit,
  ) {}
}
