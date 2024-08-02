abstract class LoginState {}

class LoginInitial extends LoginState {
  final bool isTermsChecked;
  final bool isPasswordVisible;
  final bool isLoading;

  LoginInitial({
    this.isTermsChecked = false,
    this.isPasswordVisible = true,
    this.isLoading = false,
  });

  LoginInitial copyWith({
    bool? isTermsChecked,
    bool? isPasswordVisible,
    bool? isLoading,
  }) {
    return LoginInitial(
      isTermsChecked: isTermsChecked ?? this.isTermsChecked,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoginSuccess extends LoginState {
  final String message;
  LoginSuccess({required this.message});
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
