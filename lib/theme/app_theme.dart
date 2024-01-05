import 'package:flutter/material.dart';
import 'package:twitter/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
  );

  static ThemeData secondTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.secondBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.secondBackgroundColor,
      elevation: 0,
    ),
  );
}
