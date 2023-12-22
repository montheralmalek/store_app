import 'package:dio/dio.dart';
import 'package:store_app/helper/api_request.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
  final Dio dio = Dio();

  final String _baseUrl = 'https://fakestoreapi.com/products';
  Future<ProductModel> add({
    required String title,
    required double price,
    required String description,
    required String category,
    required String img,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': img,
      });
      Response response =
          await ApiRequest().post(url: _baseUrl, data: formData);
      //return true;
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
