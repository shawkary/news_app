import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffixIcon,
    this.hintText = '',
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  final IconData? suffixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field must not be empty!';
          }
          return null;
        },
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: Icon(suffixIcon, color: Colors.grey)),
      ),
    );
  }
}
