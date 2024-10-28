import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?';
  final String _searchUrl = 'https://newsapi.org/v2/everything?';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>>getData({required String endUrl})async {
    final response = await _dio.get('$_baseUrl$endUrl');
    return response.data;
  }
  Future<Map<String, dynamic>>getSearchData({required String endUrl})async {
    final response = await _dio.get('$_searchUrl$endUrl');
    return response.data;
  }
}
