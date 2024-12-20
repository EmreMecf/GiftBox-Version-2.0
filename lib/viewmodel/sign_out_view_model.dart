import 'package:flutter/widgets.dart';
import 'package:giftbox/services/models/index.dart';
import 'package:giftbox/services/navigation/index.dart';
import 'package:giftbox/services/repositories/index.dart';

class SignOutViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;
  final NavigationService _navigationService;

  SignOutViewModel(this._navigationService, this._authRepository);

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set errorMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  set setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signOut() async {
    setLoading = true;
    final result = await _authRepository.signOut();
    if (result is Success) {
      _errorMessage = null;
      _navigationService.goHome();
    } else if (result is Failure) {
      _errorMessage = ('Hata Google Services:${result.exception}');
    }
    setLoading = false;
  }
}
