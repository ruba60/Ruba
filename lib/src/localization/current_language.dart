import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentLanguageProvider extends ChangeNotifier {
  String _currentLanguage = "en";
  String get currentLanguage => _currentLanguage;

  Future<void> changeLanguage() async {
    _currentLanguage = _currentLanguage == "ar" ? "en" : "ar";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Keys.languageKey, _currentLanguage);
    notifyListeners();
  }

  Future<void> initializeLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString(Keys.languageKey);
    if (savedLanguage != null) {
      _currentLanguage = savedLanguage;
    }
    notifyListeners();
  }
}
