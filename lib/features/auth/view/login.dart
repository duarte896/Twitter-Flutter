import 'package:flutter/material.dart';
import 'package:twitter/constants/ui_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.loginNav(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Text(
          'To get started, first enter your phone, email, or @username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ]),
    );
  }
}
