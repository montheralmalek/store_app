import 'package:store_app/models/product_model.dart';

class FavoriteCubitStates {}

class FavoriteCubitInitialState extends FavoriteCubitStates {}

class FavoriteCubitHasDataState extends FavoriteCubitStates {
  final List<ProductModel> items;
  FavoriteCubitHasDataState(this.items);
  bool isFound(String itemText) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].title == itemText) {
        return true;
      }
    }
    return false;
  }
}

class FavoriteCubitHasNotDataState extends FavoriteCubitStates {}
