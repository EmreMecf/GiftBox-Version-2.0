import 'package:flutter/material.dart';
import 'package:giftbox/services/navigation/navigation_service.dart';
import 'package:giftbox/services/repositories/firebase_auth_repository.dart';
import 'package:giftbox/viewmodel/profile_view_model.dart';

import '../services/models/network/result.dart';

class UpdateProfileViewModel with ChangeNotifier {
  final FirebaseAuthRepository _authRepository;
  final NavigationService _navigationService;
  final ProfileViewModel _profileViewModel;

  UpdateProfileViewModel(
      this._authRepository, this._navigationService, this._profileViewModel);

  String? _errorMessage;
  bool _isLoading = false;

  String? get errorMessage => _errorMessage;

  bool get isLoading => _isLoading;

  set errorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> updateDisplayName(String newName) async {
    isLoading = true;

    final result = await _authRepository.updateDisplayName(newName);

    if (result is Success<void, Exception>) {
      _errorMessage = null;
      await _authRepository.currentUser?.reload();
      _profileViewModel.updateUserName(newName);
      _navigationService.goProfile();
      await _profileViewModel.loadUserData();
    } else if (result is Failure<void, Exception>) {
      errorMessage = 'Hata: ${result.exception}';
    }

    isLoading = false;
  }
}
