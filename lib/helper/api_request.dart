import 'dart:io';

import 'package:dio/dio.dart';

class ApiRequest {
  final Dio _dio = Dio();
  Response? _response;
  Future<Response> get({required String httpUrl, CancelToken? token}) async {
    try {
      Map<String, dynamic> headers = {};
      headers.addAll({'content-Type': 'application/x-www-form-urlencoded'});
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      _response = await _dio.get(httpUrl);

      return _response!;
    } on DioException catch (e) {
      throw Exception('DioException: ${_response?.statusCode} $e');
    } on SocketException {
      throw Exception('Connection Error');
    } catch (e) {
      throw Exception('ERROR: ${_response?.statusCode} $e');
    }
  }

  Future<Response> post(
      {required String url, required FormData data, CancelToken? token}) async {
    try {
      Map<String, dynamic> headers = {};
      headers.addAll({'content-Type': 'application/x-www-form-urlencoded'});
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      _response = await _dio.post(url,
          data: data); //queryParameters: headers, cancelToken: token
      return _response!;
    } on DioException catch (e) {
      throw Exception('ERROR: ${_response?.statusCode} $e');
    } on SocketException {
      throw Exception('Connection Error');
    } catch (e) {
      throw Exception('ERROR: ${_response?.statusCode} $e');
    }
  }

  Future<Response> put(
      {required String url, required FormData data, CancelToken? token}) async {
    try {
      Map<String, dynamic> headers = {};
      headers.addAll({'content-Type': 'application/x-www-form-urlencoded'});
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      _response = await _dio.put(url,
          data: data); //queryParameters: headers, cancelToken: token
      return _response!;
    } on DioException catch (e) {
      throw Exception('ERROR: ${_response?.statusCode} $e');
    } on SocketException {
      throw Exception('Connection Error');
    } catch (e) {
      throw Exception('ERROR: ${_response?.statusCode} $e');
    }
  }
}
