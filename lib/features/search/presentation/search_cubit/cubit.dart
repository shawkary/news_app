import 'package:bee_1/core/utiles/api_service.dart';
import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.apiService) : super(SearchInitial());
  ApiService apiService;
  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSearchNews(String value) async {
    emit(LoadingSearchInitial());
    try {
      var data = await apiService.getSearchData(
          endUrl: 'q=$value&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2');
      List<NewsModel> searchList = [];
      for (var item in data['articles']) {
        searchList.add(NewsModel.fromJson(item));
      }
      emit(SuccessSearchInitial(searchList));
    } on Exception catch (e) {
      emit(ErrorSearchInitial(errMessage: e.toString()));
    }
  }
}
