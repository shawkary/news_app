import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/manager/business_cubit/states.dart';
import '../../../data/repos/home_repo.dart';


class BusinessCubit extends Cubit<BusinessStates> {
  BusinessCubit(this.homeRepo) : super(InitialBusinessNewsState());
  final HomeRepo homeRepo;


  Future<void> fetchBusinessNews() async {
    emit(LoadingGetBusinessState());
    var result = await homeRepo.fetchBusinessNews();

    result.fold((err) {
      emit(ErrorGetBusinessState(err.errorMessage));
    }, (article) {
      emit(SuccessGetBusinessState(article));
    });
  }
}
