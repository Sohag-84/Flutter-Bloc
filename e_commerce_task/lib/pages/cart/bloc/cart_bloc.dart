import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<ProductModel> cartItems = [];
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});

    on<AddToCart>(addToCart);
    on<RemoveFromCart>(removeFromCart);
  }

  FutureOr<void> addToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) {
    if (cartItems.any((item) => item.id == event.product.id)) {
      Fluttertoast.showToast(msg: "Product already added");
    } else {
      cartItems.add(event.product);
      _updateCart(emit);
      Fluttertoast.showToast(msg: "Product added to cart");
    }
  }

  FutureOr<void> removeFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) {
    cartItems.remove(event.product);
    _updateCart(emit);
    Fluttertoast.showToast(msg: "Product removed from cart");
  }

  void _updateCart(Emitter<CartState> emit) {
    double totalPrice = cartItems.fold(
        0, (sum, item) => sum + (double.parse(item.price.toString())));
    emit(CartUpdated(cartList: cartItems, totalPrice: totalPrice));
  }
}
