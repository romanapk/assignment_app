import 'package:flutter/cupertino.dart';

class ThemeChangeNotifier extends ChangeNotifier {
  bool isDarkTheme = true;
  void UpdateTheme(bool is_dark_theme) {
    this.isDarkTheme = is_dark_theme;
    notifyListeners();
  }
}
