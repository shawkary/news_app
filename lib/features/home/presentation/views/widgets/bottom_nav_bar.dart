import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(this.cubit, {super.key});
  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index)
      {
        cubit.changeBottomNavBarIndex(index);
      },
      currentIndex: cubit.currentIndex,
      backgroundColor: Colors.grey.shade100,
      selectedItemColor: Colors.lightBlue,
      items: const [
        BottomNavigationBarItem(label: 'business', icon: Icon(Icons.business)),
        BottomNavigationBarItem(label: 'science', icon: Icon(Icons.science)),
        BottomNavigationBarItem(label: 'sports', icon: Icon(Icons.sports_esports)),
      ],);
  }
}

