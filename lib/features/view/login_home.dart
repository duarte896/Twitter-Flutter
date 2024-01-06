import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';
import 'package:twitter/constants/ui_constants.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => LoginHomeState();
}

class LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    var gray = Colors.grey;
    return Scaffold(
      appBar: UIConstants.loginHomeNav(),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Text(
                "See what's happening in the world rigth now.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  print('Button tapped!');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    fixedSize: Size(700, 20)),
                child: SvgPicture.asset(AssetsConstants.googleLogo),
              ),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: 170,
                    color: gray,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Or'),
                  ),
                  Container(
                    height: 1,
                    width: 170,
                    color: gray,
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    fixedSize: Size(700, 20)),
                child: Text(
                  'Create account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                'By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.',
                style: TextStyle(fontSize: 10),
              )
            ],
          )),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            children: [
              Text(
                'Have an account already?',
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/firstLogin');
                },
                child: Text('Log in'),
              ),
            ],
          )),
    );
  }
}
