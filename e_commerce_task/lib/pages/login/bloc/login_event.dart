abstract class LoginEvent {}

class ToggleTermsCheckbox extends LoginEvent {
  final bool isChecked;
  ToggleTermsCheckbox(this.isChecked);
}

class TogglePasswordVisibility extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}
