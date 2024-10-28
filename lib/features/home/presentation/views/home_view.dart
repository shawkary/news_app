import 'package:bee_1/features/home/presentation/manager/main_cubit/cubit.dart';
import 'package:bee_1/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bee_1/features/home/presentation/views/widgets/custom_bottom_nav.dart';
import 'package:bee_1/features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.cubit});
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        drawer: CustomDrawer(cubit: cubit),
        body: cubit.views[cubit.currentIndex],
        bottomNavigationBar: CustomNavBar(cubit: cubit));
  }
}
