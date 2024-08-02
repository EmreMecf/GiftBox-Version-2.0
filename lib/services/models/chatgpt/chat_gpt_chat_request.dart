import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_gpt_chat_request.freezed.dart';
part 'chat_gpt_chat_request.g.dart';

@freezed
class ChatGptChatRequestModel with _$ChatGptChatRequestModel {
  const factory ChatGptChatRequestModel({
    required String model,
    required List<ChatGptChatMessageModel> messages,
    int? maxTokens,
    double? temperature,
  }) = _ChatGptChatRequestModel;

  factory ChatGptChatRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGptChatRequestModelFromJson(json);
}

@freezed
class ChatGptChatMessageModel with _$ChatGptChatMessageModel {
  const factory ChatGptChatMessageModel({
    required String role,
    required String content,
  }) = _ChatGptChatMessageModel;

  factory ChatGptChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGptChatMessageModelFromJson(json);
}
