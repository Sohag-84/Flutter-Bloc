import 'dart:async';

import 'package:add_to_cart/data/wishlist_items.dart';
import 'package:add_to_cart/features/home/models/home_product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemovedFromWishlist>(wishlistItemRemovedFromWishlist);
  }

  Future<FutureOr<void>> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(WishlistSuccessState(favProductList: wishlistItmes));
  }

  FutureOr<void> wishlistItemRemovedFromWishlist(
    WishlistItemRemovedFromWishlist event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItmes.remove(event.productDataModel);
    emit(WishlistSuccessState(favProductList: wishlistItmes));
  }
}
