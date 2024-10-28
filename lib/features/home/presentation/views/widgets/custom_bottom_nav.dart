import 'package:bee_1/features/home/presentation/manager/main_cubit/cubit.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.cubit});
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => cubit.changeIndex(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'business'),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
        ]);
  }
}
