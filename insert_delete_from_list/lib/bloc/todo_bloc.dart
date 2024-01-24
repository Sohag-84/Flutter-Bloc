import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:insert_delete_from_list/bloc/todo_event.dart';
import 'package:insert_delete_from_list/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<DeleteTodoEvent>(_deleteTodoEvent);
  }

  FutureOr<void> _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  FutureOr<void> _deleteTodoEvent(
      DeleteTodoEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
