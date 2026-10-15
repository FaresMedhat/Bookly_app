import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  String _baseUrl = "https://openlibrary.org/";
  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Map<String, dynamic>> getBooks({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
  }) async {
    var responce = await _dio.get(endPoints, queryParameters: queryParameters);
    return responce.data;
  }
}
