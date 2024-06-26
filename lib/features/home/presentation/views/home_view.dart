import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/business_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/science_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/sports_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.lightBlue,
        items: const [
          BottomNavigationBarItem(
              label: 'business', icon: Icon(Icons.business)),
          BottomNavigationBarItem(label: 'science', icon: Icon(Icons.science)),
          BottomNavigationBarItem(
              label: 'sports', icon: Icon(Icons.sports_esports)),
        ],
      ),
    );
  }
}
