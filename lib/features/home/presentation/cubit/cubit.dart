import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/news_model/NewsModel.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';

import '../../data/news_model/Articles.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarIndex());
  }


  NewsModel? newsModel1;
  List<Articles> list1 = [];
  void getBusiness()async {
    emit(LoadingGetBusinessState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '730514dfbb1f47bbb7b1ddf2b09244f2',
      },
    ).then((value) {
      newsModel1 = NewsModel.fromJson(value.data);
      for(int i = 0; i <= newsModel1!.articles!.length; i++){
        if(newsModel1!.articles![i].urlToImage != null){
          list1.add(newsModel1!.articles![i]);
        }
    }
      emit(SuccessGetBusinessState());
    }).catchError((error){
      emit(ErrorGetBusinessState());
    });
  }

  NewsModel? newsModel2;
  List<Articles> list2 = [];
  void getScience()async {
    emit(LoadingGetScienceState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '730514dfbb1f47bbb7b1ddf2b09244f2',
      },
    ).then((value){
      newsModel2 = NewsModel.fromJson(value.data);
      for(int i = 0; i <= newsModel2!.articles!.length; i++){
        if(newsModel2!.articles![i].urlToImage != null){
          list2.add(newsModel2!.articles![i]);
        }
      }
      emit(SuccessGetScienceState());
    }).catchError((error){
      emit(ErrorGetScienceState());
    });
  }


  NewsModel? newsModel3;
  List<Articles> list3 = [];
  void getSports()async {
    emit(LoadingGetSportsState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '730514dfbb1f47bbb7b1ddf2b09244f2',
      },
    ).then((value){
      newsModel3 = NewsModel.fromJson(value.data);
      for(int i = 0; i <= newsModel3!.articles!.length; i++){
        if(newsModel3!.articles![i].urlToImage != null){
          list3.add(newsModel3!.articles![i]);
        }
      }
      emit(SuccessGetSportsState());
    }).catchError((error){
      emit(ErrorGetSportsState());
    });
  }
}
