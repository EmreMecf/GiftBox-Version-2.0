import 'package:flutter/material.dart';

import '../services/models/chatgpt/chat_gpt_chat_response.dart';

class MessagesViewModel with ChangeNotifier {
  final List<ChatMessageModel> _messages = [];
  bool _isLoading = false;

  List<ChatMessageModel> get messages => _messages;

  bool get isLoading => _isLoading;
}
