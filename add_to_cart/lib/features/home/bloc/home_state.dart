part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {}

final class HomeErrorState extends HomeState {}

final class NavigateToWishlistPageActionState extends HomeActionState {}

final class NavigateToCartPageActionState extends HomeActionState {}
