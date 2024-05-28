import 'package:flutter/material.dart';
import 'list_view_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const ListViewItem(),
      itemCount: 10,
    );
  }
}
