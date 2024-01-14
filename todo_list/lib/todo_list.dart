import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/models/update_todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add-todo");
        },
        tooltip: "Add Todo",
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, state) {
          return state.isEmpty
              ? const Center(
                  child: Text(
                    "No todo found",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final todo = state[index];
                    return Card(
                      child: ListTile(
                        title: Text(todo.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateTodo(
                                      index: index,
                                      title: todo.name,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                context
                                    .read<TodoCubit>()
                                    .deleteTodo(index: index);
                              },
                              child: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
