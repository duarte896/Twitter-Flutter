import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/features/auth/auth.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({super.key, required this.data});

  final String data;

  @override
  State<LoginPassword> createState() => LoginPasswordState();
}

class LoginPasswordState extends State<LoginPassword> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: widget.data,
        password: _controllerPassword.text,
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

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
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
      appBar: UIConstants.loginNav(),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Enter your password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              _entryField('Password', _controllerPassword),
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
