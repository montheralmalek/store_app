import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_states_cubit.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';

class CartCubit extends Cubit<CartCubitStates> {
  CartCubit() : super(CartCubitHasNotDataState());
  final List<CartModel> _items = [];
  double _totalPrice = 0.0;

  void addItem({required ProductModel product, required int quantity}) {
    int searchResult = _searchInItems(product.title);

    if (searchResult == -1) {
      _items.add(CartModel(product: product, quantity: quantity));
      _setTotalPrice();
    } else {
      editQuantity(searchResult, _items[searchResult].quantity + quantity);
    }
    emit(CartCubitHasDataState(_items, _totalPrice));
  }

  void editQuantity(int index, int value) {
    _items[index].quantity = value;
    _setTotalPrice();
    emit(CartCubitHasDataState(_items, _totalPrice));
  }

  void removeItem(int index) {
    _items.removeAt(index);
    _setTotalPrice();
    _items.isNotEmpty
        ? emit(CartCubitHasDataState(_items, _totalPrice))
        : emit(CartCubitHasNotDataState());
  }

  void _setTotalPrice() {
    if (_items.isNotEmpty) {
      _totalPrice = 0;
      for (var element in _items) {
        _totalPrice += element.product.price * element.quantity;
      }
      _totalPrice = double.parse(_totalPrice.toStringAsFixed(2));
    }
  }

  int _searchInItems(String title) {
    int result = -1;
    if (_items.isNotEmpty) {
      for (var i = 0; i < _items.length; i++) {
        if (_items[i].product.title == title) {
          result = i;
          return result;
        }
      }
    }
    return result;
  }

  // int get getCount {
  //   return _items.length;
  // }

  // double get getTotalPrice {
  //   return _totalPrice;
  // }

  // List<CartModel> get getItems {
  //   return _items;
  // }

  // checkCartData() {
  //   BasketItems().count>0
  //       ? emit(CartCubitHasDataState())
  //       : emit(CartCubitHasNotDataState());
  // }

  // addToCart({required ProductModel product, required int quantity}) {
  //   // CartModel cartModel = CartModel(product: product, quantity: quantity);
  //   // cart.add(cartModel);
  //   // emit(CartCubitHasDataState());
  // }

  // removeFromCart(int index) {
  // //   if (cart.isNotEmpty && cart.length > index) {
  // //     cart.removeAt(index);
  // //   }
  // //   cart.isNotEmpty
  // //       ? emit(CartCubitHasDataState())
  // //       : emit(CartCubitHasNotDataState());
  //  }
}
