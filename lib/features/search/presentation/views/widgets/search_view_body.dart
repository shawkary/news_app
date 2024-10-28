import 'package:bee_1/core/utiles/custom_widgets.dart';
import 'package:bee_1/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:bee_1/features/search/presentation/search_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit cubit = SearchCubit.get(context);
        return Column(
          children: [
              CustomTextField(
                controller: searchController,
                hintText: 'search',
                suffixIcon: Icons.search,
                onChanged: (value) {
                  cubit.fetchSearchNews(value == '' ? 'any':value);
                },
              ),
            if (state is SuccessSearchInitial)
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>
                      ListViewItem(newsModel: state.searchList[index]),
                  itemCount: state.searchList.length,
                ),
              ),
          ],
        );
      },
    );
  }
}
