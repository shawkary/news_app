import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';
import '../../../../home/presentation/views/widgets/list_view_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody(this.cubit, {super.key});
  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'search',
                  suffixIcon: const Icon(Icons.search),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value)
                {
                  cubit.getSearch(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListViewItem(cubit.searchList, index),
                itemCount: cubit.searchList.length,
              ),
            ),
          ],
        );
  }
}
