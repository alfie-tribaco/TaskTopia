import 'package:flutter/material.dart';

class AppThemeToggle extends ChangeNotifier {
  bool isLightTheme = true;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}
