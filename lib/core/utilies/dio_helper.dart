import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio = Dio();

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  })async{
    return await dio.get(url, queryParameters: query);
  }
}