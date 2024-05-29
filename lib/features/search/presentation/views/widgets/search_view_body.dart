import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';
import '../../../../home/presentation/views/widgets/list_view_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
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
      },
    );
  }
}
