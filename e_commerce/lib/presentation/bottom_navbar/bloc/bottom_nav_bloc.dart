import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitialState(currentIndex: 0)) {
    on<BottomNavPageIndexChangedEvent>(bottomNavPageIndexChangedEvent);
    on<BottomNavCartPageNavigateEvent>(bottomNavCartPageNavigateEvent);
  }

  FutureOr<void> bottomNavPageIndexChangedEvent(
    BottomNavPageIndexChangedEvent event,
    Emitter<BottomNavState> emit,
  ) {
    emit(BottomNavInitialState(currentIndex: event.pageIndex));
  }

  FutureOr<void> bottomNavCartPageNavigateEvent(
    BottomNavCartPageNavigateEvent event,
    Emitter<BottomNavState> emit,
  ) {
    emit(BottomNavCartPageNavigateState());
  }
}
