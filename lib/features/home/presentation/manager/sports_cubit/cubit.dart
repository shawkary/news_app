import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/manager/sports_cubit/states.dart';

import '../../../data/repos/home_repo.dart';


class SportsCubit extends Cubit<SportsStates> {
  SportsCubit(this.homeRepo) : super(InitialSportsNewsState());
  final HomeRepo homeRepo;

  Future<void> fetchSportsNews()async {
    emit(LoadingGetSportsState());
    var result = await homeRepo.fetchSportsNews();

    result.fold((err) {
      emit(ErrorGetSportsState(err.errorMessage));
    }, (article){
      emit(SuccessGetSportsState(article));
    });
  }
}