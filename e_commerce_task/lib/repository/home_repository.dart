import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:e_commerce_task/data/local_preference.dart';

class HomeRepository {
  Future<String> logout({required String token}) async {
    http.Response response = await http.post(
      Uri.parse("https://demo.limerickbd.com/backend/public/api/logout"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    log("Logout Response: ${response.body}");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      LocalPreferenceService.instance.removeToken();
      return json['message'];
    } else {
      log("Response Status code: ${response.statusCode}");
      return "Failed";
    }
  }
}
