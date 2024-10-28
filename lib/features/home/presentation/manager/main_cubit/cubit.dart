import 'package:bee_1/core/utiles/components.dart';
import 'package:bee_1/features/home/presentation/views/widgets/business_view.dart';
import 'package:bee_1/features/home/presentation/views/widgets/science_view.dart';
import 'package:bee_1/features/home/presentation/views/widgets/sports_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  int currentIndex = 0;
  void changeIndex(int index) {
    if (index == 0) {
      currentIndex = 0;
      emit(BusinessViewState());
    } else if (index == 1) {
      currentIndex = 1;
      emit(SportsViewState());
    }else{
      currentIndex = 2;
      emit(ScienceViewState());
    }
  }

  List<Widget> views = [
    const BusinessView(),
    const SportsView(),
    const ScienceView(),
  ];

  void changeMode(String value) {
    if (value == 'light') {
      emit(LightModeState());
      isLight = true;
    } else {
      emit(DarkModeState());
      isLight = false;
    }
  }
}
