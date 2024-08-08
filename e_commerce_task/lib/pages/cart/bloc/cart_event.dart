part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddToCart extends CartEvent {
  final ProductModel product;
  AddToCart({required this.product});
}

final class RemoveFromCart extends CartEvent {
  final ProductModel product;
  RemoveFromCart({required this.product});
}

final class IncreaseCartItemQuantity extends CartEvent {
  final ProductModel product;
  IncreaseCartItemQuantity({required this.product});
}

final class DecreaseCartItemQuantity extends CartEvent {
  final ProductModel product;
  DecreaseCartItemQuantity({required this.product});
}

final class ClearCart extends CartEvent{}
