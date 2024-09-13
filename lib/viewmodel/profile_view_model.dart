import 'package:flutter/widgets.dart';
import 'package:giftbox/services/repositories/firebase_auth_repository.dart';

class ProfileViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;

  ProfileViewModel(this._authRepository);

  bool _isLoading = false;
  String? _userName;
  String? _userEmail;
  String? _userPhoto;
  String _userId = '';

  String? get userId => _userId;

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
      _userId = user.uid;
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
