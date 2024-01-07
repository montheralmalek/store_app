import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsStates {}

class GetAllProductsInitialState extends GetAllProductsStates {}

class GetAllProductsLoadedState extends GetAllProductsStates {
  final List<ProductModel> productsList;
  final List<CategoryModel>? categoriesList;
  GetAllProductsLoadedState({
    required this.productsList,
    required this.categoriesList,
  });
}

class GetAllProductsFailureLoadState extends GetAllProductsStates {
  final String error;
  GetAllProductsFailureLoadState({required this.error});
}
