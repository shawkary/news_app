import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {},
      currentIndex: 0,
      backgroundColor: Colors.grey.shade100,
      selectedItemColor: Colors.lightBlue,
      items: const [
        BottomNavigationBarItem(label: 'business', icon: Icon(Icons.business)),
        BottomNavigationBarItem(label: 'science', icon: Icon(Icons.science)),
        BottomNavigationBarItem(label: 'sports', icon: Icon(Icons.sports_esports)),
      ],);
  }
}

