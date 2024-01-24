import 'package:api_call_using_bloc/bloc/comment_bloc.dart';
import 'package:api_call_using_bloc/bloc/comment_events.dart';
import 'package:api_call_using_bloc/bloc/comment_states.dart';
import 'package:api_call_using_bloc/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(CommentFetchedEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<CommentBloc, CommentStates>(
        builder: (context, state) {
          switch (state.commentStatus) {
            case CommentStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CommentStatus.failure:
              return Text(state.message.toString());
            case CommentStatus.success:
              return ListView.builder(
                  itemCount: state.commentModel.length,
                  itemBuilder: (context, index) {
                    final data = state.commentModel[index];
                    return ListTile(
                      leading: Text(data.id.toString()),
                      title: Text(data.name.toString()),
                      subtitle: Text(data.email.toString()),
                    );
                  });
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
