part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


final class LogoutButtonPressed extends HomeEvent{}

final class ProductFetched extends HomeEvent{}
