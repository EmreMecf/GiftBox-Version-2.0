import 'package:flutter/widgets.dart';
import 'package:giftbox/services/repositories/firebase_auth_repository.dart';

import '../services/navigation/navigation_service.dart';

class ProfileViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;
  final NavigationService _navigationService;

  ProfileViewModel(this._authRepository, this._navigationService);

  bool _isLoading = false;
  String? _userName;
  String? _userEmail;
  String? _userPhoto;

  bool get isLoading => _isLoading;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  String? get userPhoto => _userPhoto;

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
      _userPhoto =
          (user.photoURL ?? const AssetImage('lib/assets/user.png')) as String?;
    }
    setLoading = false;
  }

  void updateUserName(String newName) {
    _userName = newName;
    notifyListeners();
  }
}
