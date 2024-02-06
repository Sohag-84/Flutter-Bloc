import 'dart:async';

import 'package:e_commerce/data/database/box_class.dart';
import 'package:e_commerce/data/repository/category_repository.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/database/hive_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<CategoryProductFetchedEvent>(categoryProductFetchedEvent);

    ///for added to cart product
    on<CategoryProductCartButtonClickedEvent>(
        categoryProductCartButtonClickedEvent);
  }

  FutureOr<void> categoryProductFetchedEvent(
    CategoryProductFetchedEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryProductLoadingState());
    try {
      final productList = await categoryRepository.getCategoryProduct();
      final box = Boxes.getData();

      ///product id wise quantity
      int quantity({required String id}) {
        int result = 0;
        for (int i = 0; i < box.length; i++) {
          if (box.getAt(i)!.id == id) {
            result = box.getAt(i)!.quantity;
          }
        }
        return result;
      }

      emit(CategoryProductSuccessState(
          productList: productList,
          cartItem: quantity(
            id: event.id,
          )));
    } catch (e) {
      emit(CategoryProductFailureState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> categoryProductCartButtonClickedEvent(
    CategoryProductCartButtonClickedEvent event,
    Emitter<CategoryState> emit,
  ) {
    final box = Boxes.getData();
    final existingIndex = box.values
        .toList()
        .indexWhere((element) => element.id == event.product.id);
    if (existingIndex == -1) {
      final data = HiveProduct(
        id: event.product.id!,
        quantity: event.product.proQuantity,
        name: event.product.name,
        description: event.product.description,
        price: event.product.price.toString(),
        weight: event.product.productWeight,
        image: event.product.image,
      );
      box.add(data);
      data.save();
      emit(CategoryProductCartListedState());
    }
  }
}
