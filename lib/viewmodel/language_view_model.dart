import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  Locale _currentLocale = const Locale('tr'); // Default is Turkish

  Locale get currentLocale => _currentLocale;

  void changeLanguage(String language) {
    if (language == 'Türkçe') {
      _currentLocale = const Locale('tr');
    } else if (language == 'English') {
      _currentLocale = const Locale('en');
    }
    notifyListeners(); // This triggers a rebuild in the app's UI
  }
}
