import 'package:bookly_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  String _baseUrl = "https://www.googleapis.com/books/v1/";
  String _apiKey = Constants.apiKey;
  ApiService() : _dio = Dio() {
    
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 40);
    _dio.options.receiveTimeout = const Duration(seconds: 40);
  }

  Future<Map<String, dynamic>> getBooks({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
  }) async {
    queryParameters ??= {};
    queryParameters['key'] = _apiKey;
    var response = await _dio.get(endPoints, queryParameters: queryParameters,);
    return response.data;
  }
}
