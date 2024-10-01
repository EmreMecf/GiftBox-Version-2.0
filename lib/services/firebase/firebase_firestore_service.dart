import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firestore/index.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveHistory(HistoryModel history) async {
    try {
      final docRef = _firestore.collection('history').doc();
      final historyJson = history.toJson(); // HistoryModel'i JSON'a dönüştür
      await docRef.set({
        ...historyJson,
        'timestamp': Timestamp.fromDate(history.timestamp), // Timestamp ayarı
      });
      await docRef.update({'messageId': docRef.id});
      print('Mesaj başarıyla kaydedildi.');
    } catch (e) {
      print('Mesaj kaydedilirken hata oluştu: $e');
      throw Exception('Mesaj kaydedilemedi');
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>?> getLastMessage(
      String userId) {
    return _firestore
        .collection('history')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots()
        .map((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        // Eğer doküman yoksa null döndürüyoruz
        return null;
      }
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getHistoryList(String userId) {
    return _firestore
        .collection('history')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<void> deleteMessage(String messageId) async {
    try {
      await _firestore.collection('history').doc(messageId).delete();
      print('Mesaj başarıyla silindi.');
    } catch (e) {
      print('Mesaj silinirken hata: $e');
    }
  }

  Future<void> updateMessageTitle(String messageId, String newTitle) async {
    try {
      await _firestore.collection('history').doc(messageId).update({
        'title': newTitle,
      });
      print('Mesaj başarıyla güncellendi.');
    } catch (e) {
      print('Mesaj güncellenirken hata: $e');
    }
  }
}
