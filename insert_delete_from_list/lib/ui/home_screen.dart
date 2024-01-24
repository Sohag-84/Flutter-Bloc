import 'package:flutter/material.dart';

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text(index.toString()),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        );
      }),
    );
  }
}
