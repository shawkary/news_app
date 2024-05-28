import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio = Dio();

  static init(){
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<void> get({
    required String url,
    Map<String, dynamic>? query,
  })async{
    await dio.get(url, queryParameters: query);
  }
}