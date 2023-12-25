import 'package:dio/dio.dart';
import 'package:store_app/helper/api_request.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
  final Dio dio = Dio();

  final String _baseUrl = 'https://fakestoreapi.com/products';
  Future<bool> add({
    required String title,
    required double price,
    required String description,
    required String category,
    required String img,
  }) async {
    try {
      Map<String, dynamic> body = {};
      body.addAll({'title': title});
      body.addAll({'description': description});
      body.addAll({'price': price});
      body.addAll({'image': img});
      FormData formData = FormData.fromMap(body);

      await ApiRequest().post(url: _baseUrl, data: formData);
      //return true;
      return true; //ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
