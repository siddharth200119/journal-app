import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:journal_app/theme/color_schemes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  int _colorSchemeIndex = 0;

  ThemeMode get themeMode => _themeMode;
  int get colorSchemeIndex => _colorSchemeIndex;

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get lightTheme => ThemeData(
        colorScheme: lightColorSchemes[_colorSchemeIndex],
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        colorScheme: darkColorSchemes[_colorSchemeIndex],
        brightness: Brightness.dark,
      );

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _colorSchemeIndex = prefs.getInt('colorSchemeIndex') ?? 0;
    final theme = prefs.getString('themeMode');
    if (theme == 'light') {
      _themeMode = ThemeMode.light;
    } else if (theme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = mode;
    prefs.setString('themeMode', mode.toString().split('.').last);
    notifyListeners();
  }

  void setColorScheme(int index) async {
    final prefs = await SharedPreferences.getInstance();
    _colorSchemeIndex = index;
    prefs.setInt('colorSchemeIndex', index);
    notifyListeners();
  }
}
