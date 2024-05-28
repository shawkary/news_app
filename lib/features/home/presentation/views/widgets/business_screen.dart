import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/list_view_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen(this.cubit, {super.key});
  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListViewItem(cubit.newsModel1!.articles![index]),
      itemCount: cubit.list1.length,
    );
  }
}
