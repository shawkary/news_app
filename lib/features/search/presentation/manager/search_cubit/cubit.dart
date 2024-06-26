import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/search/data/repos/search_repo.dart';
import 'package:ibrahim_project/features/search/presentation/manager/search_cubit/states.dart';


class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(InitialSearchNewsState());
  final SearchRepo searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSearchNews(String value)async {
    emit(LoadingGetSearchState());
    var result = await searchRepo.fetchSearchNews(value);

    result.fold((err) {
      emit(ErrorGetSearchState(err.errorMessage));
    }, (article){
      emit(SuccessGetSearchState(article));
    });
  }

}