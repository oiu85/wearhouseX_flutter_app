import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/driver_stats_entity.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/stock_item_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../../stock/domain/entities/stock_item_entity.dart' as stock_entity;
import '../../../stock/domain/entities/product_entity.dart' as stock_product;
import '../../../stock/domain/entities/category_entity.dart' as stock_category;

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

/// Dashboard model
@freezed
abstract class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    @JsonKey(name: 'quick_stats') required QuickStatsModel quickStats,
    @JsonKey(name: 'recent_sales') @Default([]) List<SaleModel> recentSales,
    @JsonKey(name: 'low_stock_products') @Default([]) List<LowStockProductModel> lowStockProducts,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

/// Quick stats model
@freezed
abstract class QuickStatsModel with _$QuickStatsModel {
  const factory QuickStatsModel({
    @JsonKey(name: 'today_sales', fromJson: _intFromJson) required int todaySales,
    @JsonKey(name: 'today_revenue', fromJson: _doubleFromJson) required double todayRevenue,
    @JsonKey(name: 'available_products', fromJson: _intFromJson) required int availableProducts,
    @JsonKey(name: 'low_stock_alerts', fromJson: _intFromJson) required int lowStockAlerts,
  }) = _QuickStatsModel;

  factory QuickStatsModel.fromJson(Map<String, dynamic> json) =>
      _$QuickStatsModelFromJson(json);
}

/// Low stock product model (simplified for dashboard)
@freezed
abstract class LowStockProductModel with _$LowStockProductModel {
  const factory LowStockProductModel({
    @JsonKey(name: 'product_id', fromJson: _intFromJson) required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_image') String? productImage,
    String? category,
    @JsonKey(fromJson: _intFromJson) required int quantity,
    @JsonKey(fromJson: _doubleFromJson) required double price,
    @JsonKey(name: 'stock_value', fromJson: _doubleFromJson) required double stockValue,
  }) = _LowStockProductModel;

  factory LowStockProductModel.fromJson(Map<String, dynamic> json) =>
      _$LowStockProductModelFromJson(json);
}

/// Extension to convert DashboardModel to DashboardEntity
extension DashboardModelExtension on DashboardModel {
  DashboardEntity toEntity() {
    return DashboardEntity(
      quickStats: QuickStatsEntity(
        todaySales: quickStats.todaySales,
        todayRevenue: quickStats.todayRevenue,
        availableProducts: quickStats.availableProducts,
        lowStockAlerts: quickStats.lowStockAlerts,
      ),
      recentSales: recentSales.map((sale) => sale.toEntity()).toList(),
      lowStockProducts: lowStockProducts.map((product) {
        // Convert LowStockProductModel to StockItemEntity
        // Note: This is a simplified conversion for dashboard display
        return stock_entity.StockItemEntity(
          id: 0, // Not available in dashboard response
          driverId: 0, // Not available
          productId: product.productId,
          quantity: product.quantity,
          product: stock_product.ProductEntity(
            id: product.productId,
            name: product.productName,
            price: product.price,
            categoryId: 0, // Not available
            description: null,
            image: product.productImage,
            category: product.category != null
                ? stock_category.CategoryEntity(
                    id: 0,
                    name: product.category!,
                  )
                : null,
          ),
          updatedAt: null,
        );
      }).toList(),
    );
  }
}
