import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase/index.dart';
import '../models/firestore/index.dart';

class FirebaseFirestoreRepository {
  final FirebaseFirestoreService _firestoreService;

  FirebaseFirestoreRepository(this._firestoreService);

  Future<void> saveHistory(HistoryModel history) async {
    return await _firestoreService.saveHistory(history);
  }

  // Tek bir history kaydı almak için stream
  Stream<DocumentSnapshot<Map<String, dynamic>>> getHistory(String messageId) {
    return _firestoreService.getHistoryStream(historyId: messageId);
  }

  // Belirli bir kullanıcıya ait tüm history kayıtlarını almak için stream
  Stream<List<HistoryModel>> getHistoryList(String userId) {
    return _firestoreService.getHistoryList(userId);
  }

  // Mesajı silme fonksiyonu
  Future<void> deleteHistoryMessage(String messageId) async {
    await _firestoreService.deleteMessage(messageId);
  }

  // Mesaj başlığını güncelleme fonksiyonu
  Future<void> updateMessageTitle(String messageId, String newTitle) async {
    await _firestoreService.updateMessageTitle(messageId, newTitle);
  }
}
