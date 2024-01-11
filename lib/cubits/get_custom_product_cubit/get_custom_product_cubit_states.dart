import 'package:store_app/models/product_model.dart';

class GetCustomProductsStates {}

class GetCustomProductsInitialState extends GetCustomProductsStates {}

class GetCustomProductsLoadedState extends GetCustomProductsStates {
  final List<ProductModel> productsList;
  GetCustomProductsLoadedState({required this.productsList});
}

class GetCustomProductsFailureState extends GetCustomProductsStates {
  final String error;
  GetCustomProductsFailureState({required this.error});
}
