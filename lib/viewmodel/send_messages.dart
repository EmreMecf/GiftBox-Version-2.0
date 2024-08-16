import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:giftbox/services/models/index.dart';
import 'package:giftbox/services/repositories/index.dart';

class SendMessagesViewModel with ChangeNotifier {
  final ChatGptRepository _chatGptRepository =
      GetIt.instance<ChatGptRepository>();

  final List<ChatMessageModel> _messages = [];
  bool _isLoading = false;

  List<ChatMessageModel> get messages => _messages;

  bool get isLoading => _isLoading;

  Future<void> sendMessage(String message) async {
    _messages.add(ChatMessageModel(role: 'user', content: message));

    try {
      final result = await _chatGptRepository.chaMessage(message);
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
}
