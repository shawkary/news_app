import 'package:ibrahim_project/features/home/data/news_model/Articles.dart';

abstract class BusinessStates {}

class InitialBusinessNewsState extends BusinessStates {}

class LoadingGetBusinessState extends BusinessStates {}
class SuccessGetBusinessState extends BusinessStates {
  final List<Articles> article;
  SuccessGetBusinessState(this.article);
}
class ErrorGetBusinessState extends BusinessStates {
  final String error;

  ErrorGetBusinessState(this.error);
}