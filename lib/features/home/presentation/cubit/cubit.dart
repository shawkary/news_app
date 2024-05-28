import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBarIndex(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarIndex());
  }
}