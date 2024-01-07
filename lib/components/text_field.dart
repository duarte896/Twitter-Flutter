import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          )),
    );
  }
}
