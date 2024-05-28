import 'package:flutter/material.dart';
import '../../../../../core/utilies/styles.dart';

PreferredSizeWidget? customAppBar() => AppBar(
  title: Text(
    'Latest News', style: Styles.textStyle20.copyWith(color: Colors.white),
  ),
  actions: [
    IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: Colors.white, size: 30,)
    )
  ],
  backgroundColor: Colors.lightBlue,
);
