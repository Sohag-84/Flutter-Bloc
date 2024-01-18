import 'dart:async';

import 'package:add_to_cart/data/cart_list_items.dart';
import 'package:add_to_cart/data/grocery_dart.dart';
import 'package:add_to_cart/data/wishlist_items.dart';
import 'package:add_to_cart/features/home/models/home_product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //on this event and pass this state

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    ///for navigate to wishlist screen
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

    /// for navigate to cartlist screen
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

//initial event in home page
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(
        HomeLoadedSuccessState(
          productList: GroceryData.groceryProducts
              .map((e) => ProductDataModel(
                    id: e['id'],
                    name: e['name'],
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl'],
                  ))
              .toList(),
        ),
      );
    } catch (e) {
      emit(HomeErrorState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    wishlistItmes.add(event.clickedProduct);
    emit(HomeProductWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    cartItmes.add(event.clickedProduct);
    emit(HomeProductCartlistedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(NavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(NavigateToCartPageActionState());
  }
}
