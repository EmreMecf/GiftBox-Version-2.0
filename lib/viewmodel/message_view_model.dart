import 'package:flutter/material.dart';

import '../services/models/firestore/index.dart';
import '../services/models/network/result.dart';
import '../services/repositories/firebase_firestore_repository.dart';

class MessageViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  MessageViewModel(this._firebaseFirestoreRepository);

  Stream<HistoryModel?>? messageStream;

  // Firestore'dan mesajı çek
  Future<HistoryModel?> fetchMessage(String messageId) async {
    final result = await _firebaseFirestoreRepository.fetchMessage(messageId);

    if (result is Success<HistoryModel, Exception>) {
      return result.value;
    } else {
      print('Mesaj alınırken hata: ${result.toString()}');
      return null;
    }
  }
}
