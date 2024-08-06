part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LogoutLoading extends HomeState {}

final class LogoutSuccess extends HomeState {
  final String message;
  LogoutSuccess({required this.message});
}

final class LogoutFailure extends HomeState {
  final String error;
  LogoutFailure({required this.error});
}