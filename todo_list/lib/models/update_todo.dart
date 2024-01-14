import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';

class UpdateTodo extends StatefulWidget {
  final int index;
  final String title;
  const UpdateTodo({super.key, required this.index, required this.title});

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  late TextEditingController todoTitleController;
  @override
  void initState() {
    super.initState();
    todoTitleController = TextEditingController(text: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Todo")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: "Enter todo title"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final todoCubit = BlocProvider.of<TodoCubit>(context);
                if (todoTitleController.text.trim().isNotEmpty) {
                  todoCubit.updateTodo(
                    index: widget.index,
                    title: todoTitleController.text,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
