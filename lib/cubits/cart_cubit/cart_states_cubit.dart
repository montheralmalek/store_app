import 'package:store_app/models/cart_model.dart';

class CartCubitStates {}

class CartCubitInitialState extends CartCubitStates {}

class CartCubitHasDataState extends CartCubitStates {
  final List<CartModel> items;
  final double totalPrice;
  CartCubitHasDataState(this.items, this.totalPrice);
}

class CartCubitHasNotDataState extends CartCubitStates {}
