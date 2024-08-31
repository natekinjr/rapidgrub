import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Initialize the themeMode variable with a default value (light mode)
  ThemeMode themeMode = ThemeMode.light;

  // Getter to check if the current theme is dark mode
  bool get isDarkMode => themeMode == ThemeMode.dark;

  // Function to toggle between light and dark modes
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();  // Notify listeners about the change
  }
}
