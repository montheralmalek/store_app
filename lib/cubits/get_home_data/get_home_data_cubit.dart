import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_home_data/home_data_cubit_states.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_categories_service.dart';
import 'package:store_app/services/get_products_service.dart';

class GetHomeDataCubit extends Cubit<HomeDataStates> {
  GetHomeDataCubit() : super(HomeDataInitialState());
  List<ProductModel>? productsList;
  List<CategoryModel>? categoriesList;
  getHomeData() async {
    try {
      categoriesList = await GetCategoriesService().getData();
      productsList = await GetProductsService().getData();
      emit(SuccessLoadedState(
          productsList: productsList!, categoriesList: categoriesList));
      // } on DioException catch (e) {
      //   emit(FailureLoadState(error: e.toString()));
    } catch (e) {
      emit(FailureLoadState(error: e.toString()));
    }
  }
}
