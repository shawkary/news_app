part of 'cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class LoadingSearchInitial extends SearchState {}

final class SuccessSearchInitial extends SearchState {
  final List<NewsModel> searchList;
  const SuccessSearchInitial(this.searchList);
}

final class ErrorSearchInitial extends SearchState {
  final String errMessage;
  const ErrorSearchInitial({required this.errMessage});
}
