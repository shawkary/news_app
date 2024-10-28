import 'package:bee_1/core/error/custom_error_widget.dart';
import 'package:bee_1/features/home/presentation/manager/science_cubit/cubit.dart';
import 'package:bee_1/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceView extends StatelessWidget {
  const ScienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceCubit, ScienceState>(
      builder: (context, state) {
        if (state is ScienceStateSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => ListViewItem(newsModel: state.newsList[index]),
            itemCount: state.newsList.length,
          );
        } else if (state is ScienceStateError) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
