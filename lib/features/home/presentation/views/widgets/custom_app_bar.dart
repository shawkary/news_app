import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utilies/components.dart';
import 'package:ibrahim_project/features/search/presentation/views/search_view.dart';
import '../../../../../core/utilies/styles.dart';

PreferredSizeWidget? customAppBar(context) => AppBar(
  title: Text(
    'Latest News', style: Styles.textStyle20.copyWith(color: Colors.white),
  ),
  actions: [
    IconButton(
        onPressed: ()
        {
          navigateTo(context, const SearchView());
        },
        icon: const Icon(Icons.search, color: Colors.white, size: 30,)
    )
  ],
  backgroundColor: Colors.lightBlue,
);
