import 'package:flutter/material.dart';

import '../services/repositories/index.dart';

class HistoryDeleteViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  HistoryDeleteViewModel(this._firebaseFirestoreRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> deleteMessage(BuildContext context, String messageId) async {
    _isLoading = true;
    notifyListeners();
    await _firebaseFirestoreRepository.deleteHistoryMessage(messageId);
  }
}
