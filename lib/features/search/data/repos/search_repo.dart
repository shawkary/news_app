import 'package:ibrahim_project/core/errors/failure.dart';
import 'package:ibrahim_project/features/home/data/news_model/Articles.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo
{
  Future<Either<Failure, List<Articles>>> fetchSearchNews(value);
}