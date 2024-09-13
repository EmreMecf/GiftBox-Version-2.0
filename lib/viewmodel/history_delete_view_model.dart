import 'package:flutter/material.dart';
import 'package:giftbox/services/repositories/firebase_firestore_repository.dart';

class HistoryDeleteViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  HistoryDeleteViewModel(this._firebaseFirestoreRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> deleteMessage(String messageId) async {
    _isLoading = true;
    notifyListeners();

    await _firebaseFirestoreRepository.deleteHistoryMessage(messageId);

    _isLoading = false;
    notifyListeners();
  }
}
