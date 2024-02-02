import 'dart:convert';

import 'package:e_commerce/config/app_config.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<ProductModel>> getCategoryProduct() async {
    String url = "${AppConfig.baseURL}productGroup/products";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((prouduct) => ProductModel.fromJson(prouduct)).toList();
      } else {
        throw Exception("Your status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data");
    }
  }
}
