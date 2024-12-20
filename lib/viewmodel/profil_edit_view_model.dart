import 'package:flutter/widgets.dart';
import 'package:giftbox/services/repositories/firebase_auth_repository.dart';

class ProfileEditViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;

  ProfileEditViewModel(this._authRepository);

  bool _isLoading = false;

  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
