import 'package:giftbox/services/repositories/index.dart';

class SendMessages {
  final ChatGptRepository _chatGptRepository;

  SendMessages(this._chatGptRepository);

  Future<void> sendMessage(String message) =>
      _chatGptRepository.chaMessage(message);
}
