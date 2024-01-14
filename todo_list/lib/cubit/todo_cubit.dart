import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo({required String title}) {
    final todo = Todo(name: title, createdAt: DateTime.now());

    // state.add(todo);
    // emit([...state]);
//----------> OR <------------
    emit([...state, todo]);
  }

  ///for check state changing status
  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    log(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    log("Todo cubit--> $error");
  }
}
