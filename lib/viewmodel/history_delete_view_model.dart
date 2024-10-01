import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:giftbox/core/utils/snackbar_helper.dart';

import '../services/repositories/index.dart';

class HistoryDeleteViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  HistoryDeleteViewModel(this._firebaseFirestoreRepository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> deleteMessage(BuildContext context, String messageId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _firebaseFirestoreRepository.deleteHistoryMessage(messageId);
      // Silme işlemi başarılıysa Snackbar göster
      SnackbarHelper.showAwesomeSnackbar(
        context,
        title: "Başarılı!",
        message: "Mesaj başarıyla silindi.",
        contentType: ContentType.success,
      );
    } catch (e) {
      // Hata durumunda hata mesajı gösterebiliriz
      SnackbarHelper.showAwesomeSnackbar(
        context,
        title: "Hata!",
        message: "Mesaj silinirken bir hata oluştu.",
        contentType: ContentType.failure,
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
