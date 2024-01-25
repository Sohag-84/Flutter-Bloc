import 'dart:async';

import 'package:api_call_using_bloc/bloc/user/user_event.dart';
import 'package:api_call_using_bloc/bloc/user/user_state.dart';
import 'package:api_call_using_bloc/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository = UserRepository();
  UserBloc() : super(UserInitialState()) {
    on<UserFetchedEvent>(_userFetchedEvent);
  }

  FutureOr<void> _userFetchedEvent(
    UserFetchedEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    try {
      final userData = await repository.fetchedUser();
      emit(UserSuccessState(userModel: userData));
    } catch (e) {
      emit(UserFailureState(msg: e.toString()));
    }
  }
}
