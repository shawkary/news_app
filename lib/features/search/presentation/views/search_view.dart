import 'package:bee_1/core/utiles/api_service.dart';
import 'package:bee_1/features/search/presentation/search_cubit/cubit.dart';
import 'package:bee_1/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(ApiService(Dio())),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
