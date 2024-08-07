import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/data/local_preference.dart';
import 'package:e_commerce_task/models/product_model.dart';
import 'package:e_commerce_task/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final repository = HomeRepository();
  HomeBloc() : super(HomeInitial()) {
    on<ProductFetched>(productFetched);

    on<LogoutButtonPressed>(logoutButtonPressed);
  }

  Future<void> logoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<HomeState> emit,
  ) async {
    emit(LogoutLoading());
    try {
      final token = LocalPreferenceService.instance.getToken();
      final String message = await repository.logout(token: token);
      emit(LogoutSuccess(message: message));
    } catch (e) {
      emit(LogoutFailure(error: e.toString()));
    }
  }

  Future<void> productFetched(ProductFetched event, Emitter<HomeState> emit) async{
    emit(FetchedProductLoading());
    try {
      List<ProductModel> productList = await repository.getProduct();
      emit(FetchedProductSuccess(productList: productList));
    } catch (e) {
      emit(FetchedProductFailure(error: e.toString()));
    }
  }
}
