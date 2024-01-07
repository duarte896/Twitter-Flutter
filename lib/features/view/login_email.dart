import 'package:flutter/material.dart';
import 'package:twitter/components/text_field_auth.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/features/view/login_password.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  State<LoginEmail> createState() => LoginEmailState();
}

class LoginEmailState extends State<LoginEmail> {
  String? errorMessage = '';

  final TextEditingController controllerEmail = TextEditingController();

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.loginNav(),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'To get started, first enter your phone, email, or @username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              AuthTextField(
                controller: controllerEmail,
                title: 'Phone, email or username',
                obscureText: false,
              ),
              _errorMessage()
            ],
          )),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            children: [
              Text(
                'Forgot password?',
                style: TextStyle(color: Colors.blue),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPassword(data: controllerEmail.text)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text('Next'),
              ),
            ],
          )),
    );
  }
}
