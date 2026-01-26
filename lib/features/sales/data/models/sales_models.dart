import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../../domain/entities/sale_statistics_entity.dart';

part 'sales_models.freezed.dart';
part 'sales_models.g.dart';

/// Sale item model
@freezed
abstract class SaleItemModel with _$SaleItemModel {
  const factory SaleItemModel({
    @JsonKey(name: 'product_id') required int productId,
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
      productId: productId,
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

/// Create sale request model
@freezed
abstract class CreateSaleRequestModel with _$CreateSaleRequestModel {
  const factory CreateSaleRequestModel({
    @JsonKey(name: 'customer_name') required String customerName,
    required List<CreateSaleItemRequestModel> items,
  }) = _CreateSaleRequestModel;

  factory CreateSaleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleRequestModelFromJson(json);
}

/// Create sale item request model
@freezed
abstract class CreateSaleItemRequestModel with _$CreateSaleItemRequestModel {
  const factory CreateSaleItemRequestModel({
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(fromJson: _intFromJson) required int quantity,
    @JsonKey(name: 'custom_price', includeIfNull: false) double? customPrice,
  }) = _CreateSaleItemRequestModel;

  factory CreateSaleItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleItemRequestModelFromJson(json);
}

/// Sale statistics model
@freezed
abstract class SaleStatisticsModel with _$SaleStatisticsModel {
  const factory SaleStatisticsModel({
    @JsonKey(name: 'all_time') required AllTimeStatsModel allTime,
    required PeriodStatsModel today,
    required PeriodStatsModel week,
    required PeriodStatsModel month,
    @JsonKey(name: 'average_sale_amount', fromJson: _doubleFromJson) required double averageSaleAmount,
    @JsonKey(name: 'top_products') required List<TopProductModel> topProducts,
  }) = _SaleStatisticsModel;

  factory SaleStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$SaleStatisticsModelFromJson(json);
}

/// All-time statistics model
@freezed
abstract class AllTimeStatsModel with _$AllTimeStatsModel {
  const factory AllTimeStatsModel({
    @JsonKey(name: 'total_sales', fromJson: _intFromJson) required int totalSales,
    @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson) required double totalRevenue,
  }) = _AllTimeStatsModel;

  factory AllTimeStatsModel.fromJson(Map<String, dynamic> json) =>
      _$AllTimeStatsModelFromJson(json);
}

/// Period statistics model
@freezed
abstract class PeriodStatsModel with _$PeriodStatsModel {
  const factory PeriodStatsModel({
    @JsonKey(name: 'sales_count', fromJson: _intFromJson) required int salesCount,
    @JsonKey(fromJson: _doubleFromJson) required double revenue,
  }) = _PeriodStatsModel;

  factory PeriodStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodStatsModelFromJson(json);
}

/// Top product model
@freezed
abstract class TopProductModel with _$TopProductModel {
  const factory TopProductModel({
    @JsonKey(name: 'product_id', fromJson: _intFromJson) required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'quantity_sold', fromJson: _intFromJson) required int quantitySold,
    @JsonKey(fromJson: _doubleFromJson) required double revenue,
  }) = _TopProductModel;

  factory TopProductModel.fromJson(Map<String, dynamic> json) =>
      _$TopProductModelFromJson(json);
}

/// Helper function to convert dynamic to int
int _intFromJson(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// Helper function to convert dynamic to double
double _doubleFromJson(dynamic value) {
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

/// Extension to convert SaleStatisticsModel to SaleStatisticsEntity
extension SaleStatisticsModelExtension on SaleStatisticsModel {
  SaleStatisticsEntity toEntity() {
    return SaleStatisticsEntity(
      allTime: AllTimeStatsEntity(
        totalSales: allTime.totalSales,
        totalRevenue: allTime.totalRevenue,
      ),
      today: PeriodStatsEntity(
        salesCount: today.salesCount,
        revenue: today.revenue,
      ),
      week: PeriodStatsEntity(
        salesCount: week.salesCount,
        revenue: week.revenue,
      ),
      month: PeriodStatsEntity(
        salesCount: month.salesCount,
        revenue: month.revenue,
      ),
      averageSaleAmount: averageSaleAmount,
      topProducts: topProducts.map((item) => TopProductEntity(
        productId: item.productId,
        productName: item.productName,
        quantitySold: item.quantitySold,
        revenue: item.revenue,
      )).toList(),
    );
  }
}
