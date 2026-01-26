import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/stock_request_entity.dart';

part 'stock_request_models.freezed.dart';
part 'stock_request_models.g.dart';

/// Stock request model
@freezed
abstract class StockRequestModel with _$StockRequestModel {
  const factory StockRequestModel({
    @JsonKey(name: 'id', fromJson: _intFromJson) required int id,
    @JsonKey(name: 'product_id', fromJson: _intFromJson) required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'quantity', fromJson: _intFromJson) required int quantity,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _StockRequestModel;

  factory StockRequestModel.fromJson(Map<String, dynamic> json) =>
      _$StockRequestModelFromJson(json);
}

int _intFromJson(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.parse(value);
  return 0;
}

/// Extension to convert StockRequestModel to StockRequestEntity
extension StockRequestModelExtension on StockRequestModel {
  StockRequestEntity toEntity() {
    return StockRequestEntity(
      id: id,
      productId: productId,
      productName: productName,
      quantity: quantity,
      status: status,
      rejectionReason: rejectionReason,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
