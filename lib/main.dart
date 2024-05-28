import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';
import 'package:ibrahim_project/features/splash/presentation/views/splash_view.dart';
import 'core/utilies/components.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness(),)
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
