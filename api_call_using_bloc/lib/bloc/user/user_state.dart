import 'package:api_call_using_bloc/model/user_model.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserSuccessState extends UserState {
  final UserModel userModel;

  UserSuccessState({required this.userModel});
}

final class UserLoadingState extends UserState {}

final class UserFailureState extends UserState {
  final String msg;

  UserFailureState({required this.msg});
}
