import 'package:flutter/material.dart';
import 'package:todo_list/add_todo.dart';
import 'package:todo_list/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
      initialRoute: "/",
      routes: {
        "/": (context) => const TodoList(),
        "/add-todo": (context) => const AddTodo(),
      },
    );
  }
}
