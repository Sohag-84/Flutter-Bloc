import 'package:api_call_using_bloc/bloc/user/user_bloc.dart';
import 'package:api_call_using_bloc/bloc/user/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UserFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
        return const ListTile(
          title: Text("IH Sohag"),
          subtitle: Text("ihsohag@gmail.com"),
        );
      }),
    );
  }
}
