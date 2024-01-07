import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter/components/text_field_auth.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/features/auth/auth.dart';

class LoginPassword extends StatefulWidget {
  final String data;
  const LoginPassword({super.key, required this.data});

  @override
  State<LoginPassword> createState() => LoginPasswordState();
}

class LoginPasswordState extends State<LoginPassword> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: widget.data,
        password: controllerPassword.text,
      );
      if (mounted) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (error) {
      setState(() {
        errorMessage = error.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButtom() {
    return ElevatedButton(
        onPressed: signInWithEmailAndPassword,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Text('Next'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appNav(true),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              AuthTextField(
                controller: controllerPassword,
                title: 'Password',
                obscureText: true,
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
              _submitButtom()
            ],
          )),
    );
  }
}
