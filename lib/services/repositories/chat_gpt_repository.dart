import 'package:giftbox/services/apis/index.dart';
import 'package:giftbox/services/models/index.dart';

class ChatGptRepository {
  final ChatGptApiClient chatGptApiClient;

  ChatGptRepository(this.chatGptApiClient);

  Future<Result<ChatGptChatResponseModel, Exception>> chaMessage(
      String message) async {
    try {
      final response = await chatGptApiClient.chaMessage(message);
      return Success<ChatGptChatResponseModel, Exception>(response);
    } on Exception catch (s, e) {
      return Failure<ChatGptChatResponseModel, Exception>(e as Exception);
    }
  }
}
