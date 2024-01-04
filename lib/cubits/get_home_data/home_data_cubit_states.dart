import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/product_model.dart';

class HomeDataStates {}

class HomeDataInitialState extends HomeDataStates {}

class SuccessLoadedState extends HomeDataStates {
  final List<ProductModel> productsList;
  final List<CategoryModel>? categoriesList;
  SuccessLoadedState({
    required this.productsList,
    required this.categoriesList,
  });
}

class FailureLoadState extends HomeDataStates {
  final String error;
  FailureLoadState({required this.error});
}
