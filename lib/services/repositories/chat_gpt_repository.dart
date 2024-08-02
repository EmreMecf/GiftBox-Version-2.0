import 'package:giftbox/services/apis/index.dart';
import 'package:giftbox/services/models/index.dart';

class ChatGptRepository {
  final ChatGptApiClient chatGptApiClient;

  ChatGptRepository(this.chatGptApiClient);

  Future<ChatGptChatResponseModel> sendMessage(String message) async {
    return await chatGptApiClient.sendMessage(message);
  }
}
