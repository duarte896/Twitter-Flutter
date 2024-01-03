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
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Name',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Phone number or email address',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Date of birth',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ))
              ],
            )),
        bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            child: Row(
              children: [
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
            )));
  }
}
