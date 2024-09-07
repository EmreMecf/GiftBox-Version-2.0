import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_selection_model.freezed.dart';

@freezed
class CategorySelectionModel with _$CategorySelectionModel {
  const factory CategorySelectionModel({
    String? minBudget,
    String? maxBudget,
    String? age,
    String? gender,
    String? specialDay,
    List<String>? interests,
  }) = _CategorySelectionModel;
}
