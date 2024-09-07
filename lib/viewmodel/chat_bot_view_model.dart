import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:giftbox/services/models/index.dart';
import 'package:giftbox/services/repositories/index.dart';

import '../services/models/states/category_selection_model.dart';

class ChatBotViewModel with ChangeNotifier {
  final ChatGptRepository _chatGptRepository =
      GetIt.instance<ChatGptRepository>();

  final List<ChatMessageModel> _messages = [];
  bool _isLoading = false;
  String _userMessage = '';

  List<ChatMessageModel> get messages => _messages;

  bool get isLoading => _isLoading;

  String get userMessage => _userMessage;

  set userMessage(String value) {
    _userMessage = value;
    notifyListeners();
  }

  Future<void> sendMessage(
      String message, CategorySelectionModel categorySelection) async {
    _isLoading = true;
    notifyListeners();

    // Kullanıcı mesajını ekle
    _messages.add(ChatMessageModel(role: 'user', content: message));

    // Yapay zekaya gönderilecek mesajı oluştur
    final chatGptMessage = buildChatGptMessage(categorySelection);

    try {
      final result = await _chatGptRepository.chaMessage(chatGptMessage);
      if (result is Success<ChatGptChatResponseModel, Exception>) {
        final responseMessage = result.value?.choices.first.message;
        _messages.add(responseMessage!);
      } else if (result is Failure<ChatGptChatResponseModel, Exception>) {
        _messages.add(ChatMessageModel(
          role: 'bot',
          content: 'Failed to get response: ${result.exception}',
        ));
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
