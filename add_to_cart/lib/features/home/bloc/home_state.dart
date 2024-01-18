part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> productList;

  HomeLoadedSuccessState({required this.productList});
}

final class HomeErrorState extends HomeState {
  final String errorMsg;

  HomeErrorState({required this.errorMsg});
}

final class NavigateToWishlistPageActionState extends HomeActionState {}

final class NavigateToCartPageActionState extends HomeActionState {}

final class HomeProductWishlistedActionState extends HomeActionState {}

final class HomeProductCartlistedActionState extends HomeActionState {}
