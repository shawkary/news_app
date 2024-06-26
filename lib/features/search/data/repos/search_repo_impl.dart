import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibrahim_project/core/errors/failure.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/news_model/Articles.dart';
import 'package:ibrahim_project/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this.dio);
  final DioHelper dio;

  @override
  Future<Either<Failure, List<Articles>>> fetchSearchNews(value)async {
    try {
      var data = await dio.getSearch(value: value);
      List<Articles> article = [];
      for(var item in data['articles']){
        if(item['urlToImage'] != null){
          article.add(Articles.fromJson(item));
        }
      }
      return right(article);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}