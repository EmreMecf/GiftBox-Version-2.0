import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firestore/index.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> saveHistory(HistoryModel history) async {
    try {
      final docRef = _firestore.collection('history').doc();
      final historyJson = history.toJson();
      await docRef.set({
        ...historyJson,
        'products':
            history.products?.map((product) => product.toJson()).toList(),
        'timestamp': Timestamp.fromDate(history.timestamp),
      });
      await docRef.update({'messageId': docRef.id});
      return docRef.id;
    } catch (e) {
      print('Mesaj kaydedilirken hata oluştu: $e');
      throw Exception('Mesaj kaydedilemedi');
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getToMessage(
      String messageId) {
    return FirebaseFirestore.instance
        .collection('history')
        .doc(messageId)
        .get();
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
