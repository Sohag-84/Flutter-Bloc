// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class CategoryProductFetchedEvent extends CategoryEvent {
  final String id;

  CategoryProductFetchedEvent({required this.id});


  CategoryProductFetchedEvent copyWith(String? id){
    return CategoryProductFetchedEvent(id: id ?? this.id);
  }


}

final class CategoryProductCartButtonClickedEvent extends CategoryEvent {
  final ProductModel product;

  CategoryProductCartButtonClickedEvent({required this.product});
}

final class CategoryProductIncreasedEvent extends CategoryEvent {}

final class CategoryProductDecreasedEvent extends CategoryEvent {}

class Abc {
  final String name;
  final String id;

  Abc({required this.name, required this.id});

  Abc copyWith({
    String? name,
    String? id,
  }) {
    return Abc(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
