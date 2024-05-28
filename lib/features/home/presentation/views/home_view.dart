import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/business_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/science_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/sports_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List<Widget> screens = [
          const BusinessScreen(),
          const ScienceScreen(),
          const SportsScreen(),
        ];
        return Scaffold(
          appBar: customAppBar(),
          body: screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavBar(cubit),
        );
      },
    );
  }
}
