import 'package:flutter/material.dart';

class ThemeDark {
  static ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme(
      background: Colors.blueGrey,
      brightness: Brightness.dark,
      primary: Colors.deepPurple,
      onPrimary: Colors.deepPurple.shade500,
      error: Colors.red,
      secondary: Colors.deepPurple.shade500,
      onSecondary: Colors.deepPurple.shade500,
      onError: Colors.deepPurple.shade500,
      onBackground: Colors.deepPurple.shade500,
      surface: Colors.deepPurple.shade500,
      onSurface: Colors.deepPurple.shade500,
    ), // Color Scheme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff34495E),
      elevation: 8,
      titleTextStyle: TextStyle(fontSize: 28),
    ), // AppBar Theme
    useMaterial3: false,
  ); // ThemeData
}
