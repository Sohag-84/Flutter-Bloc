import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddTodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteTodo extends Equatable {
  @override
  List<Object?> get props => [];
}
