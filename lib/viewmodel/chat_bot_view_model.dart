import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:giftbox/services/models/index.dart';
import 'package:giftbox/services/repositories/index.dart';

class ChatGptViewModel with ChangeNotifier {
  final ChatGptRepository _chatGptRepository =
      GetIt.instance<ChatGptRepository>();

  final List<ChatGptChatMessageModel> _messages = [];
  bool _isLoading = false;

  List<ChatGptChatMessageModel> get messages => _messages;

  bool get isLoading => _isLoading;

  Future<void> sendMessage(String message) async {
    _messages.add(ChatGptChatMessageModel(role: 'user', content: message));
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _chatGptRepository.sendMessage(message);
      if (result is Success<ChatGptChatResponseModel, Exception>) {
        _messages.add(
            result.value.choice.first.chaMessage as ChatGptChatMessageModel);
      } else if (result is Failure<ChatGptChatResponseModel, Exception>) {
        _messages.add(ChatGptChatMessageModel(
          role: 'bot',
          content: 'Failed to get response: ${result.exception}',
        ));
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
