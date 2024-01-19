part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class WishlistInitialEvent extends WishlistEvent {}

final class WishlistItemRemovedFromWishlist extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistItemRemovedFromWishlist({required this.productDataModel});
}
