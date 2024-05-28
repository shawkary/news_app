import 'package:flutter/material.dart';
import '../../cubit/cubit.dart';
import 'list_view_item.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen(this.cubit, {super.key});
  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const ListViewItem(),
      itemCount: 10,
    );
  }
}
