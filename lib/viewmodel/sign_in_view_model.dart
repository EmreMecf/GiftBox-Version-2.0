import 'package:flutter/cupertino.dart';

import '../services/models/network/result.dart';
import '../services/navigation/navigation_service.dart';
import '../services/repositories/firebase_auth_repository.dart';

class SignInViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;
  final NavigationService _navigationService;

  SignInViewModel(this._authRepository, this._navigationService);

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set errorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    setLoading = true;

    final result = await _authRepository.signInWithGoogle();

    if (result is Success) {
      _errorMessage = null;
      setLoading = false;
      _navigationService.goHome();
    } else if (result is Failure) {
      _errorMessage = 'Hata Google Services: ${result.exception}';
      setLoading = false;
    }
  }
}
