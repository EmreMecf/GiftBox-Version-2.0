import 'package:flutter/widgets.dart';
import 'package:giftbox/services/repositories/firebase_auth_repository.dart';

class ProfileViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;

  ProfileViewModel(this._authRepository);

  bool _isLoading = false;
  String? _userName;
  String? _userEmail;

  bool get isLoading => _isLoading;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loadUserData() async {
    setLoading = true;
    final user = _authRepository.currentUser;

    if (user != null) {
      _userName = user.displayName ?? 'Kullanıcı Adı Yok';
      _userEmail = user.email ?? 'Email Yok';
    }
    setLoading = false;
  }
}
