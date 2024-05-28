import 'package:flutter/material.dart';
import '../../cubit/cubit.dart';
import 'list_view_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen(this.cubit, {super.key});
  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const ListViewItem(),
      itemCount: 10,
    );
  }
}
