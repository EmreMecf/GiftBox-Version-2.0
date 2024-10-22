import 'package:flutter/material.dart';

class ErrorViewModel with ChangeNotifier {
  String _errorMessage = '';
  String _successMessage = '';
  bool _hasError = false;

  String get errorMessage => _errorMessage;

  String get successMessage => _successMessage;

  bool get hasError => _hasError;

  // Hata mesajı ayarlama
  void setError(String message) {
    _errorMessage = message;
    _hasError = true;
    notifyListeners();
  }

  // Başarı mesajı ayarlama
  void setSuccess(String message) {
    _successMessage = message;
    _hasError = false;
    notifyListeners();
  }

  // Mesajları temizleme
  void clearMessages() {
    _errorMessage = '';
    _successMessage = '';
    _hasError = false;
    notifyListeners();
  }
}
