import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/home/presentation/manager/business_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/science_cubit/cubit.dart';
import 'package:ibrahim_project/features/splash/presentation/views/splash_view.dart';
import 'core/utilies/components.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/sports_cubit/cubit.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BusinessCubit(HomeRepoImpl(DioHelper(Dio())))
          ..fetchBusinessNews()),
        BlocProvider(create: (context) => ScienceCubit(HomeRepoImpl(DioHelper(Dio())))
          ..fetchScienceNews()),
        BlocProvider(create: (context) => SportsCubit(HomeRepoImpl(DioHelper(Dio())))
          ..fetchSportsNews()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
