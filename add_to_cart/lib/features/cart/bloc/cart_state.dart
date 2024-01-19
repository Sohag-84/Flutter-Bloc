part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {
  final List<ProductDataModel> cartProductList;

  CartSuccessState({required this.cartProductList});
}

final class CartLoadingState extends CartState{}
