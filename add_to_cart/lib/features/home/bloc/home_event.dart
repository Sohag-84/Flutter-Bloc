part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInitialEvent extends HomeEvent {}

final class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

final class HomeProductCartButtonClickedEvent extends HomeEvent {}

final class HomeWishlistButtonNavigateEvent extends HomeEvent {}

final class HomeCartButtonNavigateEvent extends HomeEvent {}
