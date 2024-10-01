import 'package:flutter/material.dart';

import '../services/models/firestore/index.dart';
import '../services/models/index.dart';
import '../services/repositories/index.dart';

class HistoryViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  HistoryViewModel(this._firebaseFirestoreRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<HistoryModel> _historyList = [];

  List<HistoryModel> get historyList => _historyList;

  // Kullanıcıya ait geçmiş mesajları tek seferlik yükleyen fetch fonksiyonu
  Future<void> fetchHistory(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final stream = _firebaseFirestoreRepository.getHistoryList(userId);

      stream.listen((result) {
        // Başarı durumunu kontrol edin
        if (result is Success<List<HistoryModel>, Exception>) {
          _historyList =
              result.value!; // Eğer sonuç başarılıysa, veriyi alıyoruz.
        }
        // Hata durumunu kontrol edin
        else if (result is Failure<List<HistoryModel>, Exception>) {
          print("Veri çekme hatası: ${result.exception}");
        }

        _isLoading = false;
        notifyListeners();
      });
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw Exception("Veri çekme hatası: $error");
    }
  }
}
