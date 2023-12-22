import 'package:dio/dio.dart';
import 'package:store_app/helper/api_request.dart';

class UpdateProduct {
  final Dio dio = Dio();

  final String _baseUrl = 'https://fakestoreapi.com/products';
  Future<bool> update({
    required int productId,
    String? title,
    double? price,
    String? description,
    String? category,
    String? img,
  }) async {
    try {
      Map<String, dynamic> body = {};
      if (title != null) {
        body.addAll({'title': title});
      } else if (description != null) {
        body.addAll({'description': description});
      } else if (price != null) {
        body.addAll({'price': price});
      } else if (img != null) {
        body.addAll({'image': img});
      }
      if (body.isNotEmpty) {
        FormData formData = FormData.fromMap(body);
        // Response response =
        await ApiRequest().put(url: '$_baseUrl/$productId', data: formData);
        return true;
      } else {
        throw Exception('Ther is no data to update');
      }
      //ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
