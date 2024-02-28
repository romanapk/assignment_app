import 'package:flutter/material.dart';

class ThemeLight {
  static ThemeData lightThemeData = ThemeData(
    colorScheme: ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      primary: Colors.indigo,
      onPrimary: Colors.white,
      error: Colors.red,
      secondary: Colors.indigo,
      onSecondary: Colors.deepPurple.shade500,
      onError: Colors.deepPurple.shade500,
      onBackground: Colors.deepPurple.shade500,
      surface: Colors.deepPurple.shade50,
      onSurface: Colors.deepPurple.shade500,
    ), // Color Scheme
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white, size: 30),
      backgroundColor: Color(0xFFF08080), //main color
      elevation: 8,
      titleTextStyle: TextStyle(fontSize: 28),
    ), // AppBar Theme
    useMaterial3: false,
  ); // ThemeData
}
