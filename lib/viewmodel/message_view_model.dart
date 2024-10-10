import 'package:flutter/material.dart';

import '../services/models/firestore/index.dart';
import '../services/models/network/result.dart';
import '../services/repositories/firebase_firestore_repository.dart';

class MessageViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  MessageViewModel(this._firebaseFirestoreRepository);

  Stream<HistoryModel?>? messageStream;

  // Firestore'dan mesajı çek
  Stream<HistoryModel?> fetchMessage(String messageId) {
    return _firebaseFirestoreRepository
        .listenToMessage(messageId)
        .map((result) {
      if (result is Success<HistoryModel, Exception>) {
        return result.value;
      } else {
        print('Mesaj alınırken hata: ${result.toString()}');
        return null;
      }
    });
  }
}
