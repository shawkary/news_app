part of 'cubit.dart';

sealed class ScienceState extends Equatable {
  const ScienceState();

  @override
  List<Object> get props => [];
}

final class ScienceStateInitial extends ScienceState {}

final class ScienceStateLoading extends ScienceState {}

final class ScienceStateSuccess extends ScienceState {
  final List<NewsModel> newsList;
  const ScienceStateSuccess(this.newsList);
}

final class ScienceStateError extends ScienceState {
  final String errMessage;
  const ScienceStateError(this.errMessage);
}
