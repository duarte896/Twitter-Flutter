//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter/features/auth/view/login.dart';
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
      home: Login(),
      //home: Register(),
    );
  }
}
