import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';

class BasketItems {
  final List<CartModel> _items = [];
  double _totalPrice = 0.0;
  void addItem({required ProductModel product, required int quantity}) {
    _items.add(CartModel(product: product, quantity: quantity));
    _totalPrice += product.price * quantity;
  }

  set removeItem(int index) {
    _items.removeAt(index);
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<CartModel> get getItems {
    return _items;
  }
}
