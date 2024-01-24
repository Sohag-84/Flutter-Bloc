// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todoList;

  const TodoState({this.todoList = const []});
  @override
  List<Object?> get props => [todoList];

  TodoState copyWith({
    List<String>? todoList,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
    );
  }
}
