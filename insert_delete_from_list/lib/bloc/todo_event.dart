import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddTodoEvent extends TodoEvent {
  final String task;

   const AddTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTodo extends TodoEvent {
  @override
  List<Object?> get props => [];
}
