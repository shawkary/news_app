import '../../../data/news_model/Articles.dart';

abstract class SportsStates {}

class InitialSportsNewsState extends SportsStates {}

class LoadingGetSportsState extends SportsStates {}
class SuccessGetSportsState extends SportsStates {
  final List<Articles> article;
  SuccessGetSportsState(this.article);
}
class ErrorGetSportsState extends SportsStates {
  final String error;
  ErrorGetSportsState(this.error);
}