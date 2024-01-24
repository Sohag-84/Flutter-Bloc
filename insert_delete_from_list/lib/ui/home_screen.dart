import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insert_delete_from_list/bloc/todo_bloc.dart';
import 'package:insert_delete_from_list/bloc/todo_event.dart';
import 'package:insert_delete_from_list/bloc/todo_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: "task-$i"));
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text("List is emtpy"),
            );
          }
          return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index].toString()),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(
                            DeleteTodoEvent(
                              task: state.todoList[index],
                            ),
                          );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              });
        },
      ),
    );
  }
}
