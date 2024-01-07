import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit_states.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/services/get_categories_service.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesStates> {
  GetAllCategoriesCubit() : super(GetAllCategoriesInitialState());
  List<CategoryModel>? categoriesList;
  getHomeData() async {
    try {
      categoriesList = await GetCategoriesService().getData();

      emit(GetAllCategoriesLoadedState(categoriesList: categoriesList));
      // } on DioException catch (e) {
      //   emit(FailureLoadState(error: e.toString()));
    } catch (e) {
      emit(GetAllCategoriesFailureLoadState(error: e.toString()));
    }
  }

  refereshData() async {
    emit(GetAllCategoriesInitialState());
    await getHomeData();
  }
}
