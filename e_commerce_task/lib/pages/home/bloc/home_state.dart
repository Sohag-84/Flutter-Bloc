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

final class FetchedProductLoading extends HomeState {}

final class FetchedProductSuccess extends HomeState {
  final List<ProductModel> productList;
  FetchedProductSuccess({required this.productList});
}

final class FetchedProductFailure extends HomeState {
  final String error;
  FetchedProductFailure({required this.error});
}
