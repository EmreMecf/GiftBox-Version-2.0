import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_gpt_chat_response.freezed.dart';
part 'chat_gpt_chat_response.g.dart';

@freezed
class ChatGptChatResponseModel with _$ChatGptChatResponseModel {
  const factory ChatGptChatResponseModel({
    required String id,
    required String object,
    required int created,
    required String model,
    required List<ChatGptChatChoiceModel> choices,
  }) = _ChatGptChatResponseModel;

  factory ChatGptChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGptChatResponseModelFromJson(json);
}

@freezed
class ChatGptChatChoiceModel with _$ChatGptChatChoiceModel {
  const factory ChatGptChatChoiceModel({
    required ChatMessageModel message,
  }) = _ChatGptChatChoiceModel;

  factory ChatGptChatChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGptChatChoiceModelFromJson(json);
}

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required String role,
    required String content,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
