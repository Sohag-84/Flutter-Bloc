import 'dart:convert';

import 'package:e_commerce_task/config/app_config.dart';
import 'package:e_commerce_task/data/local_preference.dart';
import 'package:e_commerce_task/models/auth_result_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<AuthResult> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}login"),
        body: {
          "email": email,
          "password": password,
        },
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        LocalPreferenceService.instance.setToken(token: json['token']);
        return AuthResult(status: true, message: json['message']);
      } else {
        return AuthResult(
            status: false, message: json['message'] ?? "Authentication failed");
      }
    } catch (e) {
      return AuthResult(status: false, message: "An error occurred: $e");
    }
  }
}
