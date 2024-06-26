import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/errors/custom_error_widget.dart';
import 'package:ibrahim_project/core/utilies/dio_helper.dart';
import 'package:ibrahim_project/features/search/data/repos/search_repo_impl.dart';
import 'package:ibrahim_project/features/search/presentation/manager/search_cubit/cubit.dart';
import 'package:ibrahim_project/features/search/presentation/manager/search_cubit/states.dart';
import '../../../../home/presentation/views/widgets/list_view_item.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(SearchRepoImpl(DioHelper(Dio()))),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (BuildContext context, state) {
          SearchCubit cubit = SearchCubit.get(context);
          if (state is SuccessGetSearchState) {
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
                      cubit.fetchSearchNews(value);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListViewItem(state.article[index]),
                    itemCount: state.article.length,
                  ),
                ),
              ],
            );
          }else if(state is ErrorGetSearchState){
            return Center(child: CustomErrorWidget(errMessage: state.error));
          }else{
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
                      cubit.fetchSearchNews(value);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
