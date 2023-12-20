import 'package:dio/dio.dart';
import 'package:store_app/helper/api_request.dart';
import 'package:store_app/models/category_model.dart';

class GetCategories {
  final String mainUrl = 'https://fakestoreapi.com/products/categories';
  Future<List<CategoryModel>> getData() async {
    try {
      Response response = await ApiRequest().get(httpUrl: mainUrl);
      List<CategoryModel> categoriesList = [];
      for (var element in response.data) {
        categoriesList.add(CategoryModel.fromJson(element));
      }
      return categoriesList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
