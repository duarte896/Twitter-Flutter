import 'package:flutter/material.dart';
import 'package:twitter/constants/ui_constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.registerNav(),
    );
  }
}
