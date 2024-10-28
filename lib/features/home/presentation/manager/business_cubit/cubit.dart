import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:bee_1/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit(this.homeRepo) : super(BusinessStateInitial());

  HomeRepo homeRepo;

  Future<void> fetchBusinessNews() async {
    var result = await homeRepo.fetchBusinessNewsData();
    result.fold(
      (left) {
        emit(BusinessStateError(left.errorMessage));
      },
      (right) {
        emit(BusinessStateSuccess(right));
      },
    );
  }
}
