import 'package:store_app/models/product_model.dart';

class GetCustomProductsStates {}

class GetCustomProductsInitialState extends GetCustomProductsStates {}

class SuccessLoadedState extends GetCustomProductsStates {
  final List<ProductModel> productsList;
  SuccessLoadedState({required this.productsList});
}

class FailureLoadState extends GetCustomProductsStates {
  final String error;
  FailureLoadState({required this.error});
}
