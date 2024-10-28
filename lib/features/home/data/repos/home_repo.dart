import 'package:bee_1/core/error/failure.dart';
import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> fetchBusinessNewsData();
  Future<Either<Failure, List<NewsModel>>> fetchSportsNewsData();
  Future<Either<Failure, List<NewsModel>>> fetchScienceNewsData();
}
