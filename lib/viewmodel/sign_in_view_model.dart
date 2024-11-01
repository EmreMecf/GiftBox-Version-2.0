import 'package:firebase_auth/firebase_auth.dart';
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
      await FirebaseAuth.instance.currentUser?.reload();

      // Kullanıcı durumunu güncelledikten sonra yeniden kontrol et
      if (FirebaseAuth.instance.currentUser != null) {
        print('Navigating to home...');
        _navigationService.goHome();
      } else {
        print('User is still null after delay.');
      }

      setLoading = false;
    } else if (result is Failure) {
      _errorMessage = 'Hata Google Services: ${result.exception}';
      setLoading = false;
    }
  }
}
