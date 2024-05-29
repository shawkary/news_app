import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarIndex());
  }

  List list1 = [];
  void getBusiness()async {
    emit(LoadingGetBusinessState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2',
    ).then((value){
      fillLists(lst: value.data['articles'], list: list1);
    }).catchError((error){
      emit(ErrorGetBusinessState());
    });
  }

  List list2 = [];
  void getScience()async {
    emit(LoadingGetScienceState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2',
    ).then((value){
      fillLists(lst: value.data['articles'], list: list2);
    }).catchError((error){
      emit(ErrorGetScienceState());
    });
  }


  List list3 = [];
  void getSports()async {
    emit(LoadingGetSportsState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2',
    ).then((value){
      fillLists(lst: value.data['articles'], list: list3);
    }).catchError((error){
      emit(ErrorGetSportsState());
    });
  }

  List searchList = [];
  void getSearch(value)async {
    emit(LoadingGetSearchState());
    await DioHelper.get(
      url: 'https://newsapi.org/v2/everything?q=$value&apiKey=730514dfbb1f47bbb7b1ddf2b09244f2',
    ).then((value)async{
      fillLists(lst: value.data['articles'], list: searchList);
    }).catchError((error){
      emit(ErrorGetSearchState());
    });
  }

  /////////////////////////////////////////////////////////////////

  void fillLists({
    required lst,
    required list,
  })async{
    for(var item in lst){
      if(item['urlToImage'] != null){
        list.add(item);
      }
    }
    emit(SuccessFillListsOfArticlesState());
  }
}
