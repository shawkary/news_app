import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibrahim_project/core/errors/failure.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import '../news_model/Articles.dart';


class HomeRepoImpl implements HomeRepo
{
  HomeRepoImpl(this.dio);
  final DioHelper dio;


  @override
  Future<Either<Failure, List<Articles>>> fetchBusinessNews()async {
    try {
      var data = await dio.get(country: 'us', category: 'business');
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

  @override
  Future<Either<Failure, List<Articles>>> fetchScienceNews()async {
    try {
      var data = await dio.get(country: 'us', category: 'science');
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

  @override
  Future<Either<Failure, List<Articles>>> fetchSportsNews()async {
    try {
      var data = await dio.get(country: 'us', category: 'sports');
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