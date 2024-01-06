import 'package:flutter/material.dart';
import 'package:twitter/features/view/home.dart';
import 'package:twitter/features/view/login_email.dart';
import 'package:twitter/features/view/login_home.dart';
import 'package:twitter/features/view/login_password.dart';
import 'package:twitter/features/view/register.dart';
import 'package:twitter/theme/app_theme.dart';
//import 'package:twitter/features/auth/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      //home: const WidgetTree(),
    );
  }
}
