import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:bee_1/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ScienceCubit extends Cubit<ScienceState> {
  ScienceCubit(this.homeRepo) : super(ScienceStateInitial());

  HomeRepo homeRepo;

  Future<void> fetchScienceNews() async {
    var result = await homeRepo.fetchScienceNewsData();
    result.fold(
      (left) {
        emit(ScienceStateError(left.errorMessage));
      },
      (right) {
        emit(ScienceStateSuccess(right));
      },
    );
  }
}
