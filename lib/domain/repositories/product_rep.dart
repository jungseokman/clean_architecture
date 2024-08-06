import 'package:clean_architecture/data/models/product.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}
