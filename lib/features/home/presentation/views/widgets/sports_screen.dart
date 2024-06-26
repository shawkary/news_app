import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/manager/sports_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/sports_cubit/states.dart';
import '../../../../../core/errors/custom_error_widget.dart';
import 'list_view_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsCubit, SportsStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessGetSportsState) {
          return ListView.builder(
            itemBuilder: (context, index) => ListViewItem(state.article[index]),
            itemCount: state.article.length,
          );
        }else if(state is ErrorGetSportsState){
          return Center(child: CustomErrorWidget(errMessage: state.error));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
