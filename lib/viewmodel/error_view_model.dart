import 'package:flutter/material.dart';

class ErrorViewModel with ChangeNotifier {
  String _errorMessage = '';
  bool _hasError = false;

  String get errorMessage => _errorMessage;

  bool get hasError => _hasError;

  void setError(String message) {
    _errorMessage = message;
    _hasError = true;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    _hasError = false;
    notifyListeners();
  }
}
