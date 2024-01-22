import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:build_multiple_states/bloc/switch_event.dart';
import 'package:build_multiple_states/bloc/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableDisableNotificationEvent>(enableNotificationEvent);
  }

  FutureOr<void> enableNotificationEvent(
    EnableDisableNotificationEvent event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isEnable: !state.isEnable));
  }
}
