import 'package:flutter/material.dart';
import 'list_view_item.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const ListViewItem(),
      itemCount: 10,
    );
  }
}
