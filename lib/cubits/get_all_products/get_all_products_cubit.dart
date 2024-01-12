import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_products/get_all_products_cubit_states.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_products_service.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsStates> {
  GetAllProductsCubit() : super(GetAllProductsInitialState());

  getAllProducts() async {
    List<ProductModel>? productsList = [];
    try {
      productsList = await GetProductsService().getData();
      emit(GetAllProductsLoadedState(productsList: productsList));
      // } on DioException catch (e) {
      //   emit(FailureLoadState(error: e.toString()));
    } catch (e) {
      emit(GetAllProductsFailureLoadState(error: e.toString()));
    }
  }

  refereshData() {
    emit(GetAllProductsInitialState());
  }
}
