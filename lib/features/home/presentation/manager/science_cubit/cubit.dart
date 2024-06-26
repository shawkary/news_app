import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/manager/science_cubit/states.dart';
import '../../../data/repos/home_repo.dart';


class ScienceCubit extends Cubit<ScienceStates> {
  ScienceCubit(this.homeRepo) : super(InitialScienceNewsState());
  final HomeRepo homeRepo;

  Future<void> fetchScienceNews()async {
    emit(LoadingGetScienceState());
    var result = await homeRepo.fetchScienceNews();

    result.fold((err) {
      emit(ErrorGetScienceState(err.errorMessage));
    }, (article){
      emit(SuccessGetScienceState(article));
    });
  }}