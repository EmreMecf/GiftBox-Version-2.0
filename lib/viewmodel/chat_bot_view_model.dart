import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  bool _isLoading = false;

  ChatBotViewModel(
    this._firebaseFirestoreRepository,
    this._firebaseAuthRepository,
    this._chatGptRepository,
  );

  List<HistoryModel> _messageHistory = [];
  List<ProductsModel> _productsList = [];

  List<ProductsModel> get productsList => _productsList;

  List<HistoryModel> get messageHistory => _messageHistory;
  HistoryModel? _lastMessage;

  HistoryModel? get lastMessage => _lastMessage; // Getter

  bool get isLoading => _isLoading;

  String? get userId => _firebaseAuthRepository.currentUserId;

  // ChatGPT'ye gönderilecek mesajı oluşturur
  String defaultChatGptMessage(CategorySelectionModel categorySelection) {
    return '''
    Merhaba, seçtiğim kategoriler ile hediye ürün önerileri almak istiyorum:
    - Bütçe: ${categorySelection.minBudget} - ${categorySelection.maxBudget}
    - Yaş: ${categorySelection.age}
    - Cinsiyet: ${categorySelection.gender}
    - Özel Gün: ${categorySelection.specialDay}
    - İlgi Alanları: ${categorySelection.interests?.join(', ')}
    ''';
  }

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

  Future<void> sendMessage(
      CategorySelectionModel categorySelection, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final chatGptRequest = buildChatGptMessage(categorySelection);
    final defaultMessage = defaultChatGptMessage(categorySelection);

    // ChatGPT'ye mesaj gönderiyoruz
    final result = await _chatGptRepository.chaMessage(chatGptRequest);

    if (result is Success<ChatGptChatResponseModel, Exception>) {
      final responseMessage =
          result.value?.choices.first.message.content.replaceAll("```json", "");

      if (responseMessage != null) {
        _productsList = parseProducts(responseMessage);
        notifyListeners();

        final history = HistoryModel(
          userId: userId!,
          chatGptRequest: chatGptRequest,
          defaultUserMessage: defaultMessage,
          chatGptResponse: responseMessage,
          timestamp: DateTime.now(),
          title: AppLocalizations.of(context)!.history_cart_title_label,
        );
        // Firestore'a kaydetme
        await _firebaseFirestoreRepository.saveHistory(history);
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
   Hediye önerilerini bir JSON formatında, json isimlendirmeden sadece name, description ve keywords olacak şekilde çıkar. Yanıtında sadece JSON çıktısı olsun, "```json" gibi bir format olmadan.
    ''';
  }
}
