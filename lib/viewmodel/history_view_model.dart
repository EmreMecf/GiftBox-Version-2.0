import 'package:flutter/material.dart';
import 'package:giftbox/services/repositories/firebase_firestore_repository.dart';

import '../services/models/firestore/index.dart';

class HistoryViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  HistoryViewModel(this._firebaseFirestoreRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<HistoryModel> _historyList = [];

  List<HistoryModel> get historyList => _historyList;

  // Kullanıcıya ait geçmiş mesajları tek seferlik yükleyen fetch fonksiyonu
  Future<void> fetchHistory(String userId) async {
    _isLoading = true; // Yükleme durumu true
    notifyListeners(); // Dinleyicileri bilgilendir

    try {
      final stream = _firebaseFirestoreRepository.getHistoryList(userId);

      stream.listen((history) {
        _historyList = history;
        _isLoading = false; // Yükleme durumu false
        notifyListeners(); // Veriler değişti, dinleyicileri bilgilendir
      });
    } catch (error) {
      _isLoading = false; // Hata durumunda yükleme durumunu kapat
      notifyListeners(); // Hata durumunda da dinleyicileri bilgilendir
      throw Exception("Veri çekme hatası: $error");
    }
  }
}
