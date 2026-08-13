import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newtheme) {
    currentTheme = newtheme;
    notifyListeners();
  }

  bool isDark() => currentTheme == ThemeMode.dark ? true : false;
}
