part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoadingState extends WishlistState {}

final class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> favProductList;

  WishlistSuccessState({required this.favProductList});
}
