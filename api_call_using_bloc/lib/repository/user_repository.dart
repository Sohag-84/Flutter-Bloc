import 'dart:convert';

import 'package:api_call_using_bloc/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserModel> fetchedUser() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return UserModel.fromJson(responseData);
    } else {
      throw Exception("Fail to fetched data");
    }
  }
}
