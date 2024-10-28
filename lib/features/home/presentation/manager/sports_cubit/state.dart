part of 'cubit.dart';

sealed class SportsState extends Equatable {
  const SportsState();

  @override
  List<Object> get props => [];
}

final class SportsStateInitial extends SportsState {}

final class SportsStateLoading extends SportsState {}

final class SportsStateSuccess extends SportsState {
  final List<NewsModel> newsList;
  const SportsStateSuccess(this.newsList);
}

final class SportsStateError extends SportsState {
  final String errMessage;
  const SportsStateError(this.errMessage);
}
