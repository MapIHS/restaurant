import 'package:flutter/material.dart';
import '../services/shared_preferences_services.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferencesServices _preferencesServices =
      SharedPreferencesServices();
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _isDarkMode = await _preferencesServices.getTheme();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _preferencesServices.setTheme(_isDarkMode);
    notifyListeners();
  }
}
