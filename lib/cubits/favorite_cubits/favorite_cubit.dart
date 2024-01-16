import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_states_cubit.dart';
import 'package:store_app/models/product_model.dart';

class FavoriteCubit extends Cubit<FavoriteCubitStates> {
  FavoriteCubit() : super(FavoriteCubitHasNotDataState());
  final List<ProductModel> _items = [];

  void addItem(ProductModel product) {
    _items.add(product);
    emit(FavoriteCubitHasDataState(_items));
  }

  void removeItem(int id) {
    int index = _search(id);

    _items.removeAt(index);

    _items.isNotEmpty
        ? emit(FavoriteCubitHasDataState(_items))
        : emit(FavoriteCubitHasNotDataState());
  }

  int _search(int id) {
    int result = -1;
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].id == id) {
        result = i;
        return result;
      }
    }
    return result;
  }
}
