import 'package:flutter/material.dart';
import 'package:giftbox/services/repositories/firebase_firestore_repository.dart';

import '../services/models/chatgpt/chat_gpt_chat_response.dart';
import '../services/models/firestore/index.dart';
import '../services/models/network/result.dart';
import '../services/models/states/category_selection_model.dart';
import '../services/repositories/index.dart';

class ChatBotViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;
  final FirebaseAuthRepository _firebaseAuthRepository;
  final ChatGptRepository _chatGptRepository;

  bool _isLoading = false;

  ChatBotViewModel(
    this._firebaseFirestoreRepository,
    this._firebaseAuthRepository,
    this._chatGptRepository,
  );

  String? _userId;

  List<HistoryModel> _messageHistory = []; // Mesajlar listesi

  List<HistoryModel> get messageHistory => _messageHistory; // Getter

  bool get isLoading => _isLoading;

  String? get userId => _userId;

  Future<void> initializeUser() async {
    _userId = _firebaseAuthRepository.currentUserId;
    notifyListeners();
  }

  Future<void> sendMessage(CategorySelectionModel categorySelection) async {
    if (_userId == null) {
      await initializeUser();
    }

    if (_userId == null) {
      print('User not logged in.');
      return;
    }

    _isLoading = true;
    notifyListeners();

    // Kullanıcının mesajını kategorilere göre oluştur
    final userMessage = buildChatGptMessage(categorySelection);

    // ChatGPT'ye mesaj gönder
    final result = await _chatGptRepository.chaMessage(userMessage);

    if (result is Success<ChatGptChatResponseModel, Exception>) {
      final responseMessage = result.value?.choices.first.message.content;

      if (responseMessage != null) {
        // Firestore'a mesajı kaydet
        final history = HistoryModel(
          userId: _userId!,
          userMessage: userMessage,
          chatGptResponse: responseMessage,
          timestamp: DateTime.now(),
          title: 'Hediye Önerileri',
        );

        try {
          await _firebaseFirestoreRepository.saveHistory(history);
          // Mesajları listeye ekleyin
          _messageHistory.add(history);
          print('Mesaj kaydedildi ve ID: ${history.messageId}');
        } catch (e) {
          print('Mesaj kaydedilirken hata: $e');
        }
      }
    } else if (result is Failure<ChatGptChatResponseModel, Exception>) {
      print('ChatGPT hatası: ${result.exception}');
    }

    _isLoading = false;
    notifyListeners();
  }

  Stream<List<HistoryModel>> fetchHistoryStream() async* {
    // Kullanıcı kimliğini kontrol et
    if (_userId == null) {
      await initializeUser(); // Kullanıcı kimliğini al
    }

    // Firestore'dan gelen akışı döndür
    yield* _firebaseFirestoreRepository.getHistoryList(_userId!);
  }

  // ChatGPT'ye gönderilecek mesajı oluşturur
  String buildChatGptMessage(CategorySelectionModel categorySelection) {
    return '''
    Merhaba, seçtiğim kategoriler ile hediye önerileri almak istiyorum:
    - Bütçe: ${categorySelection.minBudget} - ${categorySelection.maxBudget}
    - Yaş: ${categorySelection.age}
    - Cinsiyet: ${categorySelection.gender}
    - Özel Gün: ${categorySelection.specialDay}
    - İlgi Alanları: ${categorySelection.interests?.join(', ')}
    ''';
  }
}
