import 'package:giftbox/services/apis/index.dart';
import 'package:giftbox/services/models/index.dart';

class ChatGptRepository {
  final ChatGptApiClient chatGptApiClient;

  ChatGptRepository(this.chatGptApiClient);

  Future<Result<ChatGptChatResponseModel, Exception>> sendMessage(
      String message) async {
    try {
      final response = await chatGptApiClient.sendMessage(message);
      return Success<ChatGptChatResponseModel, Exception>(
          response as ChatGptChatResponseModel);
    } catch (e) {
      return Failure<ChatGptChatResponseModel, Exception>(e as Exception);
    }
  }
}
