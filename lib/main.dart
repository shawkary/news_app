import 'package:bee_1/core/utiles/api_service.dart';
import 'package:bee_1/core/utiles/components.dart';
import 'package:bee_1/features/home/data/repos/home_repo_impl.dart';
import 'package:bee_1/features/home/presentation/manager/business_cubit/cubit.dart';
import 'package:bee_1/features/home/presentation/manager/main_cubit/cubit.dart';
import 'package:bee_1/features/home/presentation/manager/science_cubit/cubit.dart';
import 'package:bee_1/features/home/presentation/manager/sports_cubit/cubit.dart';
import 'package:bee_1/features/home/presentation/views/home_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider(
            create: (context) => BusinessCubit(HomeRepoImpl(ApiService(Dio())))
              ..fetchBusinessNews()),
        BlocProvider(
            create: (context) => SportsCubit(HomeRepoImpl(ApiService(Dio())))
              ..fetchSportsNews()),
        BlocProvider(
            create: (context) => ScienceCubit(HomeRepoImpl(ApiService(Dio())))
              ..fetchScienceNews()),
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          MainCubit cubit = BlocProvider.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: isLight == true ? ThemeMode.light : ThemeMode.dark,
            home: HomeView(cubit: cubit),
          );
        },
      ),
    );
  }
}
