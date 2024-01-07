import 'package:flutter/material.dart';
import 'package:twitter/components/text_field_auth.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter/features/auth/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  String? errorMessage = '';

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
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
        onPressed: createUserWithEmailAndPassword,
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
        appBar: UIConstants.registerNav(),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Create your account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Expanded(
                    child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: AuthTextField(
                                controller: controllerName,
                                title: 'Name',
                                obscureText: false)),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: AuthTextField(
                              controller: controllerEmail,
                              title: 'Email address',
                              obscureText: false,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: AuthTextField(
                              controller: controllerPassword,
                              title: 'Password',
                              obscureText: true,
                            )),
                        _errorMessage()
                      ]),
                ))
              ],
            )),
        bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            child: Row(
              children: [Spacer(), _submitButtom()],
            )));
  }
}
