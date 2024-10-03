import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    String? messageId,
    required String userId,
    required String chatGptRequest,
    required String defaultUserMessage,
    required String chatGptResponse,
    @TimestampConverter() required DateTime timestamp,
    required String title,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}

// Firestore'daki Timestamp ve DateTime arasında dönüşüm yapmak için converter
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
