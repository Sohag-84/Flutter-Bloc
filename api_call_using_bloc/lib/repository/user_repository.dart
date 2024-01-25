import 'dart:convert';

import 'package:api_call_using_bloc/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future fetchedUser() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("Fail to fetched data");
    }
  }
}
