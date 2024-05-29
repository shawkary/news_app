import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/cubit/states.dart';
import 'package:ibrahim_project/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          body: SafeArea(child: SearchViewBody(cubit)),
        );
      },
    );
  }
}
