import 'package:store_app/models/category_model.dart';

class GetAllCategoriesStates {}

class GetAllCategoriesInitialState extends GetAllCategoriesStates {}

class GetAllCategoriesLoadedState extends GetAllCategoriesStates {
  final List<CategoryModel>? categoriesList;
  GetAllCategoriesLoadedState({
    required this.categoriesList,
  });
}

class GetAllCategoriesFailureLoadState extends GetAllCategoriesStates {
  final String error;
  GetAllCategoriesFailureLoadState({required this.error});
}
