import 'package:flutter/material.dart';
import 'package:twitter/features/auth/view/home.dart';
import 'package:twitter/features/auth/view/login_email.dart';
import 'package:twitter/features/auth/view/login_home.dart';
import 'package:twitter/features/auth/view/login_password.dart';
import 'package:twitter/features/auth/view/register.dart';
import 'package:twitter/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        "/": (context) => const LoginHome(),
        "/firstLogin": (context) => const LoginEmail(),
        "/secondLogin": (context) => const LoginPassword(),
        "/register": (context) => const Register(),
        "/home": (context) => const Home()
      },
    );
  }
}
