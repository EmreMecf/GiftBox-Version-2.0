import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:giftbox/services/models/products/products_model.dart';

import '../services/models/chatgpt/chat_gpt_chat_response.dart';
import '../services/models/firestore/index.dart';
import '../services/models/network/result.dart';
import '../services/models/states/category_selection_model.dart';
import '../services/repositories/index.dart';

class ChatBotViewModel with ChangeNotifier {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;
  final FirebaseAuthRepository _firebaseAuthRepository;
  final ChatGptRepository _chatGptRepository;

  ChatBotViewModel(
    this._firebaseFirestoreRepository,
    this._firebaseAuthRepository,
    this._chatGptRepository,
  );

  List<ProductsModel> _productsList = [];

  List<ProductsModel> get productsList => _productsList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CategorySelectionModel? categorySelection;

  String? get userId => _firebaseAuthRepository.currentUserId;
  Future<HistoryModel?>? messageStream;

  List<ProductsModel> parseProducts(String? responseMessage) {
    if (responseMessage != null) {
      final jsonList = jsonDecode(responseMessage) as List<dynamic>;
      return jsonList
          .map((jsonItem) => ProductsModel.fromJson(jsonItem))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> sendMessage(CategorySelectionModel categorySelection) async {
    _isLoading = true;
    notifyListeners();

    try {
      final chatGptRequest = buildChatGptMessage(categorySelection);

      final result = await _chatGptRepository.chaMessage(chatGptRequest);

      if (result is Success<ChatGptChatResponseModel, Exception>) {
        final responseMessage = result.value?.choices.first.message.content;

        if (responseMessage != null) {
          _productsList = parseProducts(responseMessage);
          notifyListeners();

          final history = HistoryModel(
            userId: userId!,
            categorySelection: categorySelection.toJson(),
            chatGptRequest: chatGptRequest,
            chatGptResponse: responseMessage,
            timestamp: DateTime.now(),
            title: "Hediye Önerileri",
            products: _productsList,
          );
          final result =
              await _firebaseFirestoreRepository.saveHistory(history);
          messageStream = fetchMessage((result as Success)
              .value); // Firestore'dan alınan mesaj ID'yi kullanın
          notifyListeners();
        }
      } else {
        throw Exception('ChatGPT hatası: $result');
      }
    } catch (error, stackTrace) {
      print('Hata: $error');
      print('Stack trace: $stackTrace');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Firestore'dan son mesajı çek
  Future<HistoryModel?> fetchMessage(String messageId) async {
    final result = await _firebaseFirestoreRepository.fetchMessage(messageId);

    if (result is Success<HistoryModel, Exception>) {
      return result.value;
    } else if (result is Failure) {
      print('Mesaj alınırken hata: $result');
      return null;
    } else {
      return null;
    }
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
    Hediye önerilerini bir JSON formatında, json isimlendirmeden sadece name, description ve keywords olacak şekilde çıkar. Yanıtında sadece JSON çıktısı olsun, "```json" gibi bir format olmadan.
    ''';
  }
}
