import 'package:flutter/material.dart';

import '../services/models/index.dart';
import '../services/repositories/index.dart';
import 'error_view_model.dart';

class MessageTitleRenameViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;
  final ErrorViewModel _errorViewModel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MessageTitleRenameViewModel(
      this._firebaseFirestoreRepository, this._errorViewModel);

  Future<void> updateMessageTitle(String messageId, String newTitle) async {
    _isLoading = true;
    notifyListeners();

    final result = await _firebaseFirestoreRepository.updateMessageTitle(
        messageId, newTitle);

    if (result is Success) {
      _errorViewModel.setSuccess('Mesaj başlığı başarıyla güncellendi!');
    } else if (result is Failure) {
      _errorViewModel.setError('Mesaj başlığı güncellenirken bir hata oluştu.');
    }

    _isLoading = false;
    notifyListeners();
  }
}
