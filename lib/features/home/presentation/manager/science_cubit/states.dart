import '../../../data/news_model/Articles.dart';

abstract class ScienceStates {}

class InitialScienceNewsState extends ScienceStates {}

class LoadingGetScienceState extends ScienceStates {}
class SuccessGetScienceState extends ScienceStates {
  final List<Articles> article;
  SuccessGetScienceState(this.article);
}
class ErrorGetScienceState extends ScienceStates {
  final String error;
  ErrorGetScienceState(this.error);
}