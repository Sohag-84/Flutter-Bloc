import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/repository/auth_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repository = AuthRepository();
  LoginBloc() : super(LoginInitial()) {
    on<ToggleTermsCheckbox>(_onToggleTermsCheckbox);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onToggleTermsCheckbox(
      ToggleTermsCheckbox event, Emitter<LoginState> emit) {
    if (state is LoginInitial) {
      emit((state as LoginInitial).copyWith(isTermsChecked: event.isChecked));
    }
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    if (state is LoginInitial) {
      emit((state as LoginInitial).copyWith(
        isPasswordVisible: !(state as LoginInitial).isPasswordVisible,
      ));
    }
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    if (state is LoginInitial) {
      final currentState = state as LoginInitial;
      emit(currentState.copyWith(isLoading: true));

      try {
        if (event.email.trim().isEmpty || event.password.trim().isEmpty) {
          Fluttertoast.showToast(msg: "Email and password cannot be empty");
          emit(currentState.copyWith(isLoading: false));
          return;
        }

        final result = await repository.signIn(event.email, event.password);
        if (result.status) {
          emit(LoginSuccess(message: result.message));
        } else {
          emit(LoginFailure(error: result.message));
          emit(currentState.copyWith(isLoading: false));
        }
      } catch (error) {
        emit(LoginFailure(error: "An error occurred during login"));
        emit(currentState.copyWith(isLoading: false));
      }
    }
  }
}
