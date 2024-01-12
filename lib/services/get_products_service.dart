import 'package:dio/dio.dart';
import 'package:store_app/helper/api_request.dart';
import 'package:store_app/models/product_model.dart';

class GetProductsService {
  final String mainUrl = 'https://fakestoreapi.com/products';
  Future<List<ProductModel>> getData({String? categoryName}) async {
    try {
      ApiRequest apiRequest = ApiRequest();
      String url =
          categoryName == null ? mainUrl : '$mainUrl/category/$categoryName';
      Response response = await apiRequest.get(httpUrl: url);
      List<ProductModel> productsList = [];
      List<dynamic> data = response.data;
      for (var element in data) {
        productsList.add(ProductModel.fromJson(element));
      }
      return productsList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
