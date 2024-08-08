import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_task/config/app_config.dart';
import 'package:e_commerce_task/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_task/data/local_preference.dart';

class HomeRepository {
  Future<String> logout({required String token}) async {
    http.Response response = await http.post(
      Uri.parse("https://demo.limerickbd.com/backend/public/api/logout"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${LocalPreferenceService.instance.getToken()}',
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

  Future<List<ProductModel>> getProduct() async {
    final response = await http
        .get(Uri.parse("${AppConfig.baseURL}fg-with-stock"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocalPreferenceService.instance.getToken()}',
    });
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      return responseData
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception("Failed to fetched data");
    }
  }
}
