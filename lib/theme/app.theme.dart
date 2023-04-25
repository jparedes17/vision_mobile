import 'package:flutter/material.dart';

class Apptheme {
  static const Color primary = Colors.black;
  static const Color secundary = Color.fromRGBO(182, 152, 69, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
useMaterial3: true
  );
}