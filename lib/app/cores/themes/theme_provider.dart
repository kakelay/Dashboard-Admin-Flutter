import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark; // Default to dark mode

  bool get isDarkMode => themeMode == ThemeMode.dark;

  // Method to set light mode
  void setLightMode() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  // Method to set dark mode
  void setDarkMode() {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }
}
