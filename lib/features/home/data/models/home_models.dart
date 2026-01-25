import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/driver_stats_entity.dart';
import '../../domain/entities/sale_entity.dart';

part 'home_models.freezed.dart';
part 'home_models.g.dart';

/// Driver stats model
@freezed
abstract class DriverStatsModel with _$DriverStatsModel {
  const factory DriverStatsModel({
    @JsonKey(name: 'total_sales', fromJson: _intFromJson) required int totalSales,
    @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) required double totalRevenue,
    @JsonKey(name: 'today_sales', fromJson: _intFromJson) required int todaySales,
    @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) required double todayRevenue,
    @JsonKey(name: 'total_stock_items', fromJson: _intFromJson) required int totalStockItems,
    @JsonKey(name: 'recent_sales') @Default([]) List<SaleModel> recentSales,
  }) = _DriverStatsModel;

  factory DriverStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DriverStatsModelFromJson(json);
}

/// Helper function to convert dynamic to int (handles string or num)
int _intFromJson(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// Helper function to convert dynamic to double (handles string or num)
double _doubleFromJson(dynamic value) {
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

/// Extension to convert DriverStatsModel to DriverStatsEntity
extension DriverStatsModelExtension on DriverStatsModel {
  DriverStatsEntity toEntity() {
    return DriverStatsEntity(
      totalSales: totalSales,
      totalRevenue: totalRevenue,
      todaySales: todaySales,
      todayRevenue: todayRevenue,
      totalStockItems: totalStockItems,
    );
  }
}

/// Sale item model
@freezed
abstract class SaleItemModel with _$SaleItemModel {
  const factory SaleItemModel({
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(fromJson: _intFromJson) required int quantity,
    @JsonKey(fromJson: _doubleFromJson) required double price,
    @JsonKey(fromJson: _doubleFromJson) required double subtotal,
  }) = _SaleItemModel;

  factory SaleItemModel.fromJson(Map<String, dynamic> json) =>
      _$SaleItemModelFromJson(json);
}

/// Extension to convert SaleItemModel to SaleItemEntity
extension SaleItemModelExtension on SaleItemModel {
  SaleItemEntity toEntity() {
    return SaleItemEntity(
      productName: productName,
      quantity: quantity,
      price: price,
      subtotal: subtotal,
    );
  }
}

/// Sale model
@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    @JsonKey(name: 'id', fromJson: _intFromJson) required int id,
    @JsonKey(name: 'invoice_number') required String invoiceNumber,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'total_amount', fromJson: _doubleFromJson) required double totalAmount,
    @JsonKey(name: 'created_at') required String createdAt,
    @Default([]) List<SaleItemModel> items,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}

/// Extension to convert SaleModel to SaleEntity
extension SaleModelExtension on SaleModel {
  SaleEntity toEntity() {
    return SaleEntity(
      id: id,
      invoiceNumber: invoiceNumber,
      customerName: customerName,
      totalAmount: totalAmount,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}
