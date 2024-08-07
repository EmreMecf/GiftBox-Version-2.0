import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:giftbox/services/models/index.dart';

class ChatGptApiClient {
  final Dio chatGptDio;

  ChatGptApiClient(this.chatGptDio);

  Future<Response<ChatGptChatResponseModel>> sendMessage(String message) async {
    final request = ChatGptChatRequestModel(
        model: dotenv.get("CHATGPT_MODEL"),
        messages: [ChatGptChatMessageModel(role: "user", content: message)],
        maxTokens: 100,
        temperature: 1);

    return await chatGptDio.post<ChatGptChatResponseModel>("/chat/completions",
        data: request);
  }
}
