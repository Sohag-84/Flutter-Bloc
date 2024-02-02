import 'dart:async';

import 'package:e_commerce/data/repository/category_repository.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<CategoryProductFetchedEvent>(categoryProductFetchedEvent);
  }

  FutureOr<void> categoryProductFetchedEvent(
    CategoryProductFetchedEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryProductLoadingState());
    try {
      final productList = await categoryRepository.getCategoryProduct();
      emit(CategoryProductSuccessState(productList: productList));
    } catch (e) {
      emit(CategoryProductFailureState(errorMsg: e.toString()));
    }
  }
}
