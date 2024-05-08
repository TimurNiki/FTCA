import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscureText = false});
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter $hintText";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
