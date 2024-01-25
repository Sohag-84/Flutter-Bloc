import 'package:api_call_using_bloc/bloc/user/user_bloc.dart';
import 'package:api_call_using_bloc/bloc/user/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_state.dart';

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

   Future<void> _refresh() async {
    context.read<UserBloc>().add(UserFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserFailureState) {
            return Text(state.msg);
          }
          if (state is UserSuccessState) {
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    final user = state.userList[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(user.id.toString())),
                      title: Text(user.name.toString()),
                      subtitle: Text(user.address?.city ?? "n/a"),
                    );
                  }),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
