import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/errors/custom_error_widget.dart';
import 'package:ibrahim_project/features/home/presentation/manager/business_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/business_cubit/states.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/list_view_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, BusinessStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessGetBusinessState) {
          return ListView.builder(
            itemBuilder: (context, index) => ListViewItem(state.article[index]),
            itemCount: state.article.length,
          );
        }else if(state is ErrorGetBusinessState){
          return Center(child: CustomErrorWidget(errMessage: state.error));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
