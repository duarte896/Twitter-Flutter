import 'package:flutter/material.dart';
import 'package:twitter/constants/ui_constants.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({super.key});

  @override
  State<LoginPassword> createState() => LoginPasswordState();
}

class LoginPasswordState extends State<LoginPassword> {
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              )
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
                  print('Button tapped!');
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
