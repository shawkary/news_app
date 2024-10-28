import 'package:bee_1/core/utiles/components.dart';
import 'package:bee_1/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

customAppBar(BuildContext context) => AppBar(
      title: const Text('Latest News', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
            onPressed: () {
              navigateTo(context, const SearchView());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ))
      ],
    );
