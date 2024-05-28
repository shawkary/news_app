import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/business_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/science_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/sports_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const BusinessScreen(),
      const ScienceScreen(),
      const SportsScreen(),
    ];
    return Scaffold(
      appBar: customAppBar(),
      body: screens[0],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
