import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firestore/index.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveHistory(HistoryModel history) async {
    try {
      final docRef = _firestore.collection('history').doc();

      await docRef.set({
        'userId': history.userId,
        'userMessage': history.userMessage,
        'chatGptResponse': history.chatGptResponse,
        'timestamp': Timestamp.fromDate(history.timestamp),
        'title': history.title,
      });

      await docRef.update({
        'messageId': docRef.id,
      });

      print('Mesaj başarıyla kaydedildi.');
    } catch (e) {
      print('Mesaj kaydedilirken hata oluştu: $e');
      throw Exception('Mesaj kaydedilemedi');
    }
  }

  Stream<List<HistoryModel>> getHistoryList(String userId) {
    return _firestore
        .collection('history')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return HistoryModel(
          messageId: doc.id,
          // Belgenin ID'sini kullanarak messageId'yi alıyoruz
          userId: doc['userId'],
          userMessage: doc['userMessage'],
          chatGptResponse: doc['chatGptResponse'],
          timestamp: (doc['timestamp'] as Timestamp).toDate(),
          title: doc['title'],
        );
      }).toList();
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getHistoryStream({
    required String historyId,
  }) {
    return _firestore.collection('history').doc(historyId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getHistoryListStream({
    required String userId,
  }) {
    return _firestore
        .collection('history')
        .where("userId", isEqualTo: userId)
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
