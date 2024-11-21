import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.textInputTypee,
    required this.isPassword,
    required this.hintText,
    required this.myController,
    this.validator,
  });
  final TextInputType textInputTypee;
  final bool isPassword;
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      keyboardType: textInputTypee,
      obscureText: isPassword,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
    );
  }
}
