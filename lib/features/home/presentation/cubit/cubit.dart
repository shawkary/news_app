import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/news_model/NewsModel.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarIndex());
  }

  NewsModel? newsModel;

  void getBusiness()async {
    emit(LoadingGetBusinessState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '730514dfbb1f47bbb7b1ddf2b09244f2',
      },
    ).then((value){
      newsModel = NewsModel.fromJson(value.data);
      emit(SuccessGetBusinessState());
    }).catchError((error){
      emit(ErrorGetBusinessState());
    });
  }

  void getScience()async {
    emit(LoadingGetScienceState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '730514dfbb1f47bbb7b1ddf2b09244f2',
      },
    ).then((value){
      newsModel = NewsModel.fromJson(value.data);
      emit(SuccessGetScienceState());
    }).catchError((error){
      emit(ErrorGetScienceState());
    });
  }

  void getSports()async {
    emit(LoadingGetSportsState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '730514dfbb1f47bbb7b1ddf2b09244f2',
      },
    ).then((value){
      newsModel = NewsModel.fromJson(value.data);
      emit(SuccessGetSportsState());
    }).catchError((error){
      emit(ErrorGetSportsState());
    });
  }
}
