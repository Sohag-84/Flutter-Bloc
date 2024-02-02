part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryProductSuccessState extends CategoryState {
  final List<ProductModel> productList;

  CategoryProductSuccessState({required this.productList});
}

final class CategoryProductFailureState extends CategoryState {
  final String errorMsg;

  CategoryProductFailureState({required this.errorMsg});
}

final class CategoryProductLoadingState extends CategoryState {}
