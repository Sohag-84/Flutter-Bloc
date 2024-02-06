import 'dart:convert';

import 'package:e_commerce/config/app_config.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future getCategoryProduct() async {
    String url = "${AppConfig.baseURL}productGroup/products/appTestProducts";

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
