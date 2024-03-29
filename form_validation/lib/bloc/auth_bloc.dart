import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log("Auth bloc --> $change");
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final String email = event.email;
      final String password = event.password;
      if (!email.contains("@gmail.com")) {
        return emit(AuthFailure(errorMessage: "Enter valid email"));
      }
      if (password.length < 6) {
        emit(AuthFailure(errorMessage: "Password can't be less 6 characters"));
        return; //so that further process doesn't execute
      }

      await Future.delayed(const Duration(seconds: 1), () {
        emit(AuthSuccess(uid: "$email-$password"));
        return;
      });
    } catch (e) {
      return emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      return emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
