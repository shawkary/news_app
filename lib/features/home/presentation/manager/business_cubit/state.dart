part of 'cubit.dart';

sealed class BusinessState extends Equatable {
  const BusinessState();

  @override
  List<Object> get props => [];
}

final class BusinessStateInitial extends BusinessState {}

final class BusinessStateLoading extends BusinessState {}

final class BusinessStateSuccess extends BusinessState {
  final List<NewsModel> newsList;
  const BusinessStateSuccess(this.newsList);
}

final class BusinessStateError extends BusinessState {
  final String errMessage;
  const BusinessStateError(this.errMessage);
}
