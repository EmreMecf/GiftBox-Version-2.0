import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:giftbox/services/models/index.dart';

class ChatGptApiClient {
  final Dio chatGptDio;

  ChatGptApiClient(this.chatGptDio);

  Future<ChatGptChatResponseModel> chaMessage(String message) async {
    final request = ChatGptChatRequestModel(
      model: dotenv.get("CHATGPT_MODEL"),
      messages: [ChatGptChatMessageModel(role: "user", content: message)],
    );

    final response = await chatGptDio.post("/chat/completions", data: request);
    return ChatGptChatResponseModel.fromJson(response.data);
  }
}
