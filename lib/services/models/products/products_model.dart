import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.freezed.dart';
part 'products_model.g.dart';

@freezed
class ProductsModel with _$ProductsModel {
  const factory ProductsModel({
    required String name,
    required String description,
    required List<String> keywords,
  }) = _ProductsModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
}
