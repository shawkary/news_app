import '../../../../home/data/news_model/Articles.dart';

abstract class SearchStates {}

class InitialSearchNewsState extends SearchStates {}

class LoadingGetSearchState extends SearchStates {}
class SuccessGetSearchState extends SearchStates {
  final List<Articles> article;
  SuccessGetSearchState(this.article);
}
class ErrorGetSearchState extends SearchStates {
  final String error;
  ErrorGetSearchState(this.error);
}