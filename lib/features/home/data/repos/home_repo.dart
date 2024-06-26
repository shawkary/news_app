import 'package:ibrahim_project/core/errors/failure.dart';
import 'package:ibrahim_project/features/home/data/news_model/Articles.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo
{
  Future<Either<Failure, List<Articles>>> fetchBusinessNews();
  Future<Either<Failure, List<Articles>>> fetchScienceNews();
  Future<Either<Failure, List<Articles>>> fetchSportsNews();
}