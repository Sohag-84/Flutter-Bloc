// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:api_call_using_bloc/model/comment_model.dart';
import 'package:api_call_using_bloc/utils/enum.dart';

class CommentStates extends Equatable {
  final CommentStatus commentStatus;
  final List<CommentModel> commentModel;
  final String message;

  const CommentStates({
    this.commentStatus = CommentStatus.loading,
    this.commentModel = const <CommentModel>[],
    this.message = "",
  });

  @override
  List<Object?> get props => [commentStatus, commentModel];

  CommentStates copyWith({
    CommentStatus? commentStatus,
    List<CommentModel>? commentModel,
    String? message,
  }) {
    return CommentStates(
      commentStatus: commentStatus ?? this.commentStatus,
      commentModel: commentModel ?? this.commentModel,
      message: message ?? this.message,
    );
  }
}
