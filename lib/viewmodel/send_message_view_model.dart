import 'package:giftbox/services/repositories/index.dart';

class SendMessagesViewModel {
  final ChatGptRepository _chatGptRepository;

  SendMessagesViewModel(this._chatGptRepository);

  Future<void> sendMessage(String message) =>
      _chatGptRepository.chaMessage(message);
}
