part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialEvent extends CartEvent {}

final class CartRemovedFromCartList extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemovedFromCartList({required this.productDataModel});
}
