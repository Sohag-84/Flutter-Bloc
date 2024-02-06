part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialEvent extends CartEvent {}

final class CartAddedProductEvent extends CartEvent {
  final ProductModel productModel;

  CartAddedProductEvent({required this.productModel});
}

final class CartDeleteProductEvent extends CartEvent {}

final class CartIncrementProductEvent extends CartEvent {}

final class CartDecrementProductEvent extends CartEvent {}
