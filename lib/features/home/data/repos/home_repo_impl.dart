import 'package:bee_1/core/error/failure.dart';
import 'package:bee_1/core/utiles/api_service.dart';
import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:bee_1/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<NewsModel>>> fetchBusinessNewsData() async {
    try {
      var data = await apiService.getData(
          endUrl:
              'country=us&category=business&apiKey=6f333a0bdac94cf986ce801b60e61265');
      List<NewsModel> newsList = [];
      for (var item in data['articles']) {
        if (item['urlToImage'] != null) {
          newsList.add(NewsModel.fromJson(item));
        }
      }
      return right(newsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> fetchSportsNewsData() async {
    try {
      var data = await apiService.getData(
          endUrl:
              'country=us&category=sports&apiKey=6f333a0bdac94cf986ce801b60e61265');
      List<NewsModel> newsList = [];
      for (var item in data['articles']) {
        if (item['title'] != '[Removed]' && item['description'] != '[Removed]') {
          newsList.add(NewsModel.fromJson(item));
        }
      }
      return right(newsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> fetchScienceNewsData() async {
    try {
      var data = await apiService.getData(
          endUrl:
              'country=us&category=science&apiKey=6f333a0bdac94cf986ce801b60e61265');
      List<NewsModel> newsList = [];
      for (var item in data['articles']) {
        if (item['title'] != '[Removed]' && item['description'] != '[Removed]') {
          newsList.add(NewsModel.fromJson(item));
        }
      }
      return right(newsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
