import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
