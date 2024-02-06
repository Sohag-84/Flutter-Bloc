part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

sealed class CategoryProductActionState extends CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryProductSuccessState extends CategoryState {
  final List<ProductModel> productList;
  final int cartItem;

  CategoryProductSuccessState({
    required this.productList,
    required this.cartItem,
  });
}

final class CategoryProductFailureState extends CategoryState {
  final String errorMsg;

  CategoryProductFailureState({required this.errorMsg});
}

final class CategoryProductLoadingState extends CategoryState {}

///for added to cart product
final class CategoryProductCartListedState extends CategoryProductActionState {}
