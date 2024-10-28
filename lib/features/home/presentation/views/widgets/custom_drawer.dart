import 'package:bee_1/features/home/presentation/manager/main_cubit/cubit.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.cubit});
  final MainCubit cubit;

  static String? text;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton(
                  items: const [
                    DropdownMenuItem(value: 'light', child: Text('light')),
                    DropdownMenuItem(value: 'dark', child: Text('dark')),
                  ],
                  onChanged: (value) {
                    text = value!;
                    cubit.changeMode(value);
                    // Navigator.pop(context);
                  },
                  hint: const Text('choose mood'),
                  value: text,
                ),
              ],
            )));
  }
}
