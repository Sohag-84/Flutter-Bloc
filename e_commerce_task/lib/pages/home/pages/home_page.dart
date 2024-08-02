import 'package:e_commerce_task/data/local_preference.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          LocalPreferenceService.instance.getToken(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
