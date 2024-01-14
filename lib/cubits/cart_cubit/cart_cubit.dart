import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_states_cubit.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';

class CartCubit extends Cubit<CartCubitStates> {
  CartCubit() : super(CartCubitHasNotDataState());
  final List<CartModel> _items = [];
  double _totalPrice = 0.0;
  void setCartCubitState() {
    count > 0
        ? emit(CartCubitHasDataState(_items))
        : emit(CartCubitHasNotDataState());
  }

  void addItem({required ProductModel product, required int quantity}) {
    _items.add(CartModel(product: product, quantity: quantity));
    _totalPrice += product.price * quantity;
    //notifyListeners();
    emit(CartCubitHasDataState(_items));
  }

  void removeItem(int index) {
    _items.removeAt(index);
    count > 0
        ? emit(CartCubitHasDataState(_items))
        : emit(CartCubitHasNotDataState());
    //notifyListeners();
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
