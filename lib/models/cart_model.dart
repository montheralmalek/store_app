import 'package:store_app/models/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;
  CartModel({
    required this.product,
    required this.quantity,
  });
}
