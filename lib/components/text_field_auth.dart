import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool obscureText;

  const AuthTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: title,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
    ;
  }
}
