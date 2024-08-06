import 'package:e_commerce_task/data/local_preference.dart';
import 'package:e_commerce_task/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Fluttertoast.showToast(msg: state.message);
              }
              if (state is LogoutFailure) {
                Fluttertoast.showToast(msg: state.error);
              }
            },
            child: IconButton(
              onPressed: () {
                LocalPreferenceService.instance.removeToken();
                context.read<HomeBloc>().add(LogoutButtonPressed());
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          LocalPreferenceService.instance.getToken().toString(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
