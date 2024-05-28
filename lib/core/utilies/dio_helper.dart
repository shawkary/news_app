import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio = Dio();

  // static init(){
  //   dio = Dio(BaseOptions(
  //     baseUrl: 'https://newsapi.org/v2/top-headlines?',
  //     receiveDataWhenStatusError: true,
  //   ));
  // }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  })async{
    return await dio.get(url, queryParameters: query);
  }
}