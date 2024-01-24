import 'dart:async';

import 'package:api_call_using_bloc/bloc/comment_events.dart';
import 'package:api_call_using_bloc/bloc/comment_states.dart';
import 'package:api_call_using_bloc/repository/comment_repository.dart';
import 'package:api_call_using_bloc/utils/enum.dart';
import 'package:bloc/bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentStates> {
  CommentRepository commentRepository = CommentRepository();
  CommentBloc() : super(const CommentStates()) {
    on<CommentFetchedEvent>(_commentFetchedEvent);
  }

  FutureOr<void> _commentFetchedEvent(
    CommentFetchedEvent event,
    Emitter<CommentStates> emit,
  ) async{
   await commentRepository.fetchComment().then((value) {
      emit(state.copyWith(
        commentStatus: CommentStatus.success,
        commentModel: value,
        message: "success",
      ));
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
          commentStatus: CommentStatus.failure,
          message: error.toString(),
        ),
      );
    });
  }
}
