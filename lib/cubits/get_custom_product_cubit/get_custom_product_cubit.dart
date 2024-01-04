import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit_states.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_products_service.dart';

class GetCustomProductsCubit extends Cubit<GetCustomProductsStates> {
  GetCustomProductsCubit() : super(GetCustomProductsInitialState());
  List<ProductModel>? productsList;

  getCustomProducts({required String category}) async {
    try {
      productsList = await GetProductsService().getData(categoryName: category);
      emit(SuccessLoadedState(productsList: productsList!));
    } catch (e) {
      emit(FailureLoadState(error: e.toString()));
    }
  }
}
