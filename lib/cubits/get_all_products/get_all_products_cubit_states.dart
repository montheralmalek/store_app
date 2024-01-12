import 'package:store_app/models/product_model.dart';

class GetAllProductsStates {}

class GetAllProductsInitialState extends GetAllProductsStates {}

class GetAllProductsLoadedState extends GetAllProductsStates {
  final List<ProductModel> productsList;
  GetAllProductsLoadedState({
    required this.productsList,
  });
}

class GetAllProductsFailureLoadState extends GetAllProductsStates {
  final String error;
  GetAllProductsFailureLoadState({required this.error});
}
