import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/stock_item_entity.dart';
import '../../domain/entities/stock_statistics_entity.dart';

part 'stock_models.freezed.dart';
part 'stock_models.g.dart';

/// Category model
@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    String? description,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

/// Extension to convert CategoryModel to CategoryEntity
extension CategoryModelExtension on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      description: description,
    );
  }
}

/// Product model
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String name,
    @JsonKey(name: 'price', fromJson: _priceFromJson) required String priceString,
    @JsonKey(name: 'category_id', fromJson: _categoryIdFromJson) required int categoryId,
    String? description,
    String? image,
    CategoryModel? category,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Custom parsing to handle:
    // 1. price as num (double) or String - convert to String
    // 2. category_id from nested category object or direct value
    final priceValue = json['price'];
    final priceString = _priceFromJson(priceValue);
    
    final categoryId = _categoryIdFromJson(json['category_id'] ?? json['category']?['id']);
    
    final jsonFixed = {
      ...json,
      'price': priceString, // Convert price to String for generated code
      'category_id': categoryId,
    };
    return _$ProductModelFromJson(jsonFixed);
  }
}

/// Helper function to extract category_id from category object or direct value
int _categoryIdFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  if (value is Map && value.containsKey('id')) {
    final id = value['id'];
    if (id is num) return id.toInt();
    if (id is String) return int.tryParse(id) ?? 0;
  }
  return 0;
}


/// Extension to convert ProductModel to ProductEntity
extension ProductModelExtension on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: double.tryParse(priceString) ?? 0.0,
      categoryId: categoryId ?? 0,
      description: description,
      image: image,
      category: category?.toEntity(),
    );
  }
}

/// Stock item model (for API response format)
@freezed
abstract class StockItemResponseModel with _$StockItemResponseModel {
  const factory StockItemResponseModel({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(name: 'product_id', fromJson: _intFromJson) required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_description') String? productDescription,
    @JsonKey(name: 'product_image') String? productImage,
    Map<String, dynamic>? category,
    @JsonKey(fromJson: _priceFromJson) required String price,
    @JsonKey(fromJson: _intFromJson) required int quantity,
    @JsonKey(name: 'stock_value', fromJson: _doubleFromJson) required double stockValue,
    @JsonKey(name: 'is_low_stock', fromJson: _boolFromJson) required bool isLowStock,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _StockItemResponseModel;

  factory StockItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StockItemResponseModelFromJson(json);
}

/// Helper function to safely convert to int
int _intFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// Helper function to convert price from num/String to String
String _priceFromJson(dynamic value) {
  if (value == null) return '0.0';
  if (value is num) return value.toString();
  if (value is String) return value;
  return value.toString();
}

/// Helper function to safely convert to double
double _doubleFromJson(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

/// Helper function to safely convert to bool
bool _boolFromJson(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  return false;
}

/// Stock item model (legacy - for internal use)
@freezed
abstract class StockItemModel with _$StockItemModel {
  const factory StockItemModel({
    required int id,
    @JsonKey(name: 'driver_id') required int driverId,
    @JsonKey(name: 'product_id') required int productId,
    required int quantity,
    required ProductModel product,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _StockItemModel;

  factory StockItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockItemModelFromJson(json);
}

/// Extension to convert StockItemResponseModel to StockItemEntity
extension StockItemResponseModelExtension on StockItemResponseModel {
  StockItemEntity toEntity() {
    // Parse category if available
    CategoryModel? categoryModel;
    if (category != null) {
      try {
        categoryModel = CategoryModel.fromJson(category!);
      } catch (e) {
        // If category parsing fails, leave it as null
        categoryModel = null;
      }
    }

    // Create ProductModel from flat structure
    final productModel = ProductModel(
      id: productId,
      name: productName,
      priceString: price,
      categoryId: categoryModel?.id ?? 0,
      description: productDescription,
      image: productImage,
      category: categoryModel,
    );

    return StockItemEntity(
      id: id,
      driverId: 0, // Not provided in API response
      productId: productId,
      quantity: quantity,
      product: productModel.toEntity(),
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}

/// Extension to convert StockItemModel to StockItemEntity
extension StockItemModelExtension on StockItemModel {
  StockItemEntity toEntity() {
    return StockItemEntity(
      id: id,
      driverId: driverId,
      productId: productId,
      quantity: quantity,
      product: product.toEntity(),
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}

/// Stock detail model
@freezed
abstract class StockDetailModel with _$StockDetailModel {
  const factory StockDetailModel({
    required int id,
    required ProductModel product,
    required int quantity,
    required double stockValue,
    @JsonKey(name: 'is_low_stock') required bool isLowStock,
    @JsonKey(name: 'last_updated') String? lastUpdated,
    @JsonKey(name: 'assignment_history') List<AssignmentHistoryModel>? assignmentHistory,
  }) = _StockDetailModel;

  factory StockDetailModel.fromJson(Map<String, dynamic> json) {
    // Custom parsing to handle:
    // 1. stock_value (snake_case) from API -> stockValue (camelCase)
    // 2. Safe type conversions for all numeric fields
    final stockValueRaw = json['stock_value'] ?? json['stockValue'];
    final fixedJson = <String, dynamic>{
      'id': json['id'] is num ? json['id'] : _intFromJson(json['id']),
      'product': json['product'],
      'quantity': json['quantity'] is num ? json['quantity'] : _intFromJson(json['quantity']),
      'stockValue': stockValueRaw is num ? stockValueRaw : _doubleFromJson(stockValueRaw),
      'is_low_stock': json['is_low_stock'] ?? json['isLowStock'] ?? false,
      'last_updated': json['last_updated'] ?? json['lastUpdated'],
      'assignment_history': json['assignment_history'] ?? json['assignmentHistory'],
    };
    return _$StockDetailModelFromJson(fixedJson);
  }
}

/// Assignment history model
@freezed
abstract class AssignmentHistoryModel with _$AssignmentHistoryModel {
  const factory AssignmentHistoryModel({
    required int id,
    required int quantity,
    @JsonKey(name: 'price_at_assignment') double? priceAtAssignment,
    @JsonKey(name: 'assigned_from') required String assignedFrom,
    @JsonKey(name: 'assigned_at') required String assignedAt,
  }) = _AssignmentHistoryModel;

  factory AssignmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentHistoryModelFromJson(json);
}

/// Stock statistics model
@freezed
abstract class StockStatisticsModel with _$StockStatisticsModel {
  const factory StockStatisticsModel({
    @JsonKey(name: 'total_products') required int totalProducts,
    @JsonKey(name: 'total_quantity') required int totalQuantity,
    @JsonKey(name: 'stock_value') required double stockValue,
    @JsonKey(name: 'low_stock_threshold') required int lowStockThreshold,
    @JsonKey(name: 'low_stock_count') required int lowStockCount,
    @JsonKey(name: 'low_stock_items') required List<LowStockItemModel> lowStockItems,
    @JsonKey(name: 'category_breakdown') required List<CategoryBreakdownModel> categoryBreakdown,
  }) = _StockStatisticsModel;

  factory StockStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StockStatisticsModelFromJson(json);
}

/// Low stock item model
@freezed
abstract class LowStockItemModel with _$LowStockItemModel {
  const factory LowStockItemModel({
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    required int quantity,
  }) = _LowStockItemModel;

  factory LowStockItemModel.fromJson(Map<String, dynamic> json) =>
      _$LowStockItemModelFromJson(json);
}

/// Category breakdown model
@freezed
abstract class CategoryBreakdownModel with _$CategoryBreakdownModel {
  const factory CategoryBreakdownModel({
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'product_count') required int productCount,
    @JsonKey(name: 'total_quantity') required int totalQuantity,
    @JsonKey(name: 'category_value') required double categoryValue,
  }) = _CategoryBreakdownModel;

  factory CategoryBreakdownModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryBreakdownModelFromJson(json);
}

/// Extension to convert StockStatisticsModel to StockStatisticsEntity
extension StockStatisticsModelExtension on StockStatisticsModel {
  StockStatisticsEntity toEntity() {
    return StockStatisticsEntity(
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
      stockValue: stockValue,
      lowStockCount: lowStockCount,
      lowStockThreshold: lowStockThreshold,
      lowStockItems: lowStockItems.map((item) => LowStockItemEntity(
        productId: item.productId,
        productName: item.productName,
        quantity: item.quantity,
      )).toList(),
      categoryBreakdown: categoryBreakdown.map((item) => CategoryBreakdownEntity(
        categoryId: item.categoryId,
        categoryName: item.categoryName,
        productCount: item.productCount,
        totalQuantity: item.totalQuantity,
        categoryValue: item.categoryValue,
      )).toList(),
    );
  }
}
