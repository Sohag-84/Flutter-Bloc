import 'dart:async';

import 'package:add_to_cart/data/cart_list_items.dart';
import 'package:add_to_cart/features/home/models/home_product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  Future<FutureOr<void>> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(CartSuccessState(cartProductList: cartItmes));
  }
}
