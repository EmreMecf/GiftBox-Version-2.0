import '../firebase/index.dart';
import '../models/firestore/index.dart';
import '../models/index.dart';

class FirebaseFirestoreRepository {
  final FirebaseFirestoreService _firestoreService;

  FirebaseFirestoreRepository(this._firestoreService);

  /// History kaydını Firestore'a kaydetme
  Future<Result<void, Exception>> saveHistory(HistoryModel history) async {
    try {
      await _firestoreService.saveHistory(history);
      return const Success(null); // Başarılı sonuç
    } catch (e) {
      return Failure(Exception('History kaydedilemedi: $e')); // Hata sonucu
    }
  }

  Stream<Result<HistoryModel, Exception>> getLastMessage(String userId) {
    return _firestoreService.getLastMessage(userId).map((snapshot) {
      if (snapshot != null && snapshot.exists) {
        try {
          final history = HistoryModel.fromJson(snapshot.data()!);
          return Success(history); // Başarılı sonuç
        } catch (e) {
          return Failure(Exception('Veri dönüştürme hatası: $e'));
        }
      } else {
        // Eğer snapshot boş ise, bir Failure sonucu döndürelim
        return Failure(Exception('Son mesaj bulunamadı.'));
      }
    });
  }

  /// Kullanıcıya ait tüm history kayıtlarını almak için stream
  Stream<Result<List<HistoryModel>, Exception>> getHistoryList(String userId) {
    return _firestoreService.getHistoryList(userId).map((querySnapshot) {
      try {
        final historyList = querySnapshot.docs.map((doc) {
          return HistoryModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();

        return Success(historyList); // Başarılı sonuç
      } catch (e) {
        return Failure(Exception('History listesi alınamadı: $e'));
      }
    });
  }

  /// Mesajı silme fonksiyonu
  Future<Result<void, Exception>> deleteHistoryMessage(String messageId) async {
    try {
      await _firestoreService.deleteMessage(messageId);
      return const Success(null); // Başarılı sonuç
    } catch (e) {
      return Failure(Exception('Mesaj silinemedi: $e')); // Hata sonucu
    }
  }

  /// Mesaj başlığını güncelleme fonksiyonu
  Future<Result<void, Exception>> updateMessageTitle(
      String messageId, String newTitle) async {
    try {
      await _firestoreService.updateMessageTitle(messageId, newTitle);
      return const Success(null); // Başarılı sonuç
    } catch (e) {
      return Failure(
          Exception('Mesaj başlığı güncellenemedi: $e')); // Hata sonucu
    }
  }
}
