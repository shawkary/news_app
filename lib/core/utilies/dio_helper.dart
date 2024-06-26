import 'package:dio/dio.dart';

class DioHelper
{
  DioHelper(this._dio);
  final Dio _dio;


  Future<Map<String, dynamic>> get({
    String lang = 'en',
    required String country,
    required String category,
  })async{
    _dio.options.headers = {
      'lang': lang,
      'Content-Type':'application/json',
    };
    var response =  await _dio.get('https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2');
    return response.data;
  }

  Future<Map<String, dynamic>> getSearch({
    String lang = 'en',
    required String value,
  })async{
    _dio.options.headers = {
      'lang': lang,
      'Content-Type':'application/json',
    };
    var response =  await _dio.get('https://newsapi.org/v2/top-headlines?q=$value&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2');
    return response.data;
  }
}