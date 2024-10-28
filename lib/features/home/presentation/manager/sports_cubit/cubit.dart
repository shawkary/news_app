import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:bee_1/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit(this.homeRepo) : super(SportsStateInitial());

  HomeRepo homeRepo;

  Future<void> fetchSportsNews() async {
    var result = await homeRepo.fetchSportsNewsData();
    result.fold(
      (left) {
        emit(SportsStateError(left.errorMessage));
      },
      (right) {
        emit(SportsStateSuccess(right));
      },
    );
  }
}
