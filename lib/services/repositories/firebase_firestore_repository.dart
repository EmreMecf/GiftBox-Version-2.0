import '../firebase/index.dart';
import '../models/firestore/index.dart';
import '../models/index.dart';

class FirebaseFirestoreRepository {
  final FirebaseFirestoreService _firestoreService;

  FirebaseFirestoreRepository(this._firestoreService);

  /// History kaydını Firestore'a kaydetme
  Future<Result<String, Exception>> saveHistory(HistoryModel history) async {
    try {
      final id = await _firestoreService.saveHistory(history);
      return Success(id); // Başarılı sonuç
    } catch (e) {
      return Failure(Exception('History kaydedilemedi: $e')); // Hata sonucu
    }
  }

  Future<Result<HistoryModel, Exception>> fetchMessage(String messageId) async {
    try {
      final docSnapshot = await _firestoreService.getToMessage(messageId);

      if (docSnapshot.exists && docSnapshot.data() != null) {
        final history = HistoryModel.fromJson(docSnapshot.data()!);
        return Success(history);
      } else {
        return Failure(Exception('Mesaj bulunamadı.'));
      }
    } catch (e) {
      return Failure(Exception('Veri çekme hatası: $e'));
    }
  }

  /// Kullanıcıya ait tüm history kayıtlarını almak için stream
  Stream<Result<List<HistoryModel>, Exception>> getHistoryList(String userId) {
    return _firestoreService.getHistoryList(userId).map((querySnapshot) {
      try {
        final historyList = querySnapshot.docs.map((doc) {
          return HistoryModel.fromJson(doc.data());
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
      return const Success(null);
    } catch (e) {
      return Failure(Exception('Mesaj silinemedi:')); // Hata sonucu
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
