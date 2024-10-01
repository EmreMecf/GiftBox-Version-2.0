import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/models/chatgpt/chat_gpt_chat_response.dart';
import '../services/models/firestore/index.dart';
import '../services/models/network/result.dart';
import '../services/models/products/products_model.dart';
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

  List<HistoryModel> _messageHistory = [];

  List<HistoryModel> get messageHistory => _messageHistory;
  HistoryModel? _lastMessage;

  HistoryModel? get lastMessage => _lastMessage; // Getter

  bool get isLoading => _isLoading;

  String? get userId => _firebaseAuthRepository.currentUserId;

  HistoryModel buildProductMessage(ProductsModel product) {
    return HistoryModel(
      messageId: null,
      // Firestore'a kaydederken otomatik oluşturulabilir
      userId: userId!,
      userMessage: product.name,
      // Ürün adı kullanıcı mesajı olarak
      chatGptResponse: product.description,
      // Ürün açıklaması ChatGPT yanıtı olarak
      timestamp: DateTime.now(),
      title: 'Ürün: ${product.name}', // Başlık olarak ürün ismini kullanıyoruz
    );
  }

  Future<void> sendMessage(CategorySelectionModel categorySelection) async {
    _isLoading = true;
    notifyListeners();

    final userMessage = buildChatGptMessage(categorySelection);

    // ChatGPT'ye mesaj gönderiyoruz
    final result = await _chatGptRepository.chaMessage(userMessage);

    if (result is Success<ChatGptChatResponseModel, Exception>) {
      final responseMessage = result.value?.choices.first.message.content;

      if (responseMessage != null) {
        final products = parseProductsFromJson(responseMessage);

        // Ürünleri chat ekranına ekliyoruz
        _messageHistory
            .addAll(products.map((product) => buildProductMessage(product)));

        // (Opsiyonel) Firestore'a mesajı kaydediyoruz
        final history = HistoryModel(
          userId: userId!,
          userMessage: userMessage,
          chatGptResponse: responseMessage,
          timestamp: DateTime.now(),
          title: 'Hediye Önerileri',
        );

        // Firestore'a kaydetme
        await _firebaseFirestoreRepository.saveHistory(history);

        print('Mesaj kaydedildi ve ID: ${history.messageId}');
      }
    } else {
      print('ChatGPT hatası: $result');
    }

    _isLoading = false;
    notifyListeners();
  }

  Stream<HistoryModel?> fetchLastMessage() {
    return _firebaseFirestoreRepository.getHistoryList(userId!).map((result) {
      if (result is Success<List<HistoryModel>, Exception>) {
        final historyList = result.value;

        if (historyList!.isNotEmpty) {
          return historyList
              .first; // Listenin ilk elemanını yani son mesajı döndürüyoruz
        } else {
          return null; // Eğer boşsa null döndürüyoruz
        }
      } else {
        print(result.toString()); // Hata varsa hata mesajını yazdır
        return null; // Hata durumunda null döndürüyoruz
      }
    });
  }

  // ChatGPT'ye gönderilecek mesajı oluşturur
  String buildChatGptMessage(CategorySelectionModel categorySelection) {
    return '''
    Merhaba, seçtiğim kategoriler ile hediye ürün önerileri almak istiyorum:
    - Bütçe: ${categorySelection.minBudget} - ${categorySelection.maxBudget}
    - Yaş: ${categorySelection.age}
    - Cinsiyet: ${categorySelection.gender}
    - Özel Gün: ${categorySelection.specialDay}
    - İlgi Alanları: ${categorySelection.interests?.join(', ')}
    Hediye önerilerini bir json'da ürün adı, açıklama, anahtar kelimeler olacak şekilde çıkaramanı istiyorum. Bu json'nın keyleri ingilizce değerleri türkçe olsun.
    ''';
  }

  List<ProductsModel> parseProductsFromJson(String responseMessage) {
    final List<dynamic> jsonList = jsonDecode(responseMessage);
    return jsonList.map((json) => ProductsModel.fromJson(json)).toList();
  }
}
