import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_selection_model.freezed.dart';
part 'category_selection_model.g.dart'; // JSON destek dosyası

@freezed
class CategorySelectionModel with _$CategorySelectionModel {
  @JsonSerializable(explicitToJson: true)
  const factory CategorySelectionModel({
    String? minBudget,
    String? maxBudget,
    String? age,
    String? gender,
    String? specialDay,
    List<String>? interests,
  }) = _CategorySelectionModel;

  factory CategorySelectionModel.fromJson(Map<String, dynamic> json) =>
      _$CategorySelectionModelFromJson(json);
}
