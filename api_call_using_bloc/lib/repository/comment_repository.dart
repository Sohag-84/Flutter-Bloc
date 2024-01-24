import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_call_using_bloc/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentRepository {
  Future<List<CommentModel>> fetchComment() async {
    String url = "https://jsonplaceholder.typicode.com/comments";

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return CommentModel(
            postId: e['postId'],
            id: e['id'],
            name: e['name'] as String,
            body: e['body'] as String,
            email: e['email'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception("Internet issue");
    } on TimeoutException {
      throw Exception("Time out exception");
    }
    throw Exception("Error while fetching data");
  }
}
