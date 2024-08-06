import 'dart:convert';

import 'package:clean_architecture/data/models/product.dart';
import 'package:clean_architecture/domain/repositories/product_rep.dart';
import 'package:http/http.dart' as http;

class HttpProductRepository implements ProductRepository {
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.https('fakestoreapi.com', 'products'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<ProductModel> products =
          body.map((dynamic item) => ProductModel.fromJson(item)).toList();

      return products.cast<ProductModel>();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
