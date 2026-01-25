// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      priceString: json['price'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      description: json['description'] as String?,
      image: json['image'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.priceString,
      'category_id': instance.categoryId,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
    };

_StockItemResponseModel _$StockItemResponseModelFromJson(
  Map<String, dynamic> json,
) => _StockItemResponseModel(
  id: _intFromJson(json['id']),
  productId: _intFromJson(json['product_id']),
  productName: json['product_name'] as String,
  productDescription: json['product_description'] as String?,
  productImage: json['product_image'] as String?,
  category: json['category'] as Map<String, dynamic>?,
  price: _priceFromJson(json['price']),
  quantity: _intFromJson(json['quantity']),
  stockValue: _doubleFromJson(json['stock_value']),
  isLowStock: _boolFromJson(json['is_low_stock']),
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$StockItemResponseModelToJson(
  _StockItemResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_description': instance.productDescription,
  'product_image': instance.productImage,
  'category': instance.category,
  'price': instance.price,
  'quantity': instance.quantity,
  'stock_value': instance.stockValue,
  'is_low_stock': instance.isLowStock,
  'updated_at': instance.updatedAt,
};

_StockItemModel _$StockItemModelFromJson(Map<String, dynamic> json) =>
    _StockItemModel(
      id: (json['id'] as num).toInt(),
      driverId: (json['driver_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$StockItemModelToJson(_StockItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'product': instance.product,
      'updated_at': instance.updatedAt,
    };

_StockDetailModel _$StockDetailModelFromJson(Map<String, dynamic> json) =>
    _StockDetailModel(
      id: (json['id'] as num).toInt(),
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      stockValue: (json['stockValue'] as num).toDouble(),
      isLowStock: json['is_low_stock'] as bool,
      lastUpdated: json['last_updated'] as String?,
      assignmentHistory: (json['assignment_history'] as List<dynamic>?)
          ?.map(
            (e) => AssignmentHistoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$StockDetailModelToJson(_StockDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'stockValue': instance.stockValue,
      'is_low_stock': instance.isLowStock,
      'last_updated': instance.lastUpdated,
      'assignment_history': instance.assignmentHistory,
    };

_AssignmentHistoryModel _$AssignmentHistoryModelFromJson(
  Map<String, dynamic> json,
) => _AssignmentHistoryModel(
  id: (json['id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  priceAtAssignment: (json['price_at_assignment'] as num?)?.toDouble(),
  assignedFrom: json['assigned_from'] as String,
  assignedAt: json['assigned_at'] as String,
);

Map<String, dynamic> _$AssignmentHistoryModelToJson(
  _AssignmentHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'price_at_assignment': instance.priceAtAssignment,
  'assigned_from': instance.assignedFrom,
  'assigned_at': instance.assignedAt,
};

_StockStatisticsModel _$StockStatisticsModelFromJson(
  Map<String, dynamic> json,
) => _StockStatisticsModel(
  totalProducts: (json['total_products'] as num).toInt(),
  totalQuantity: (json['total_quantity'] as num).toInt(),
  stockValue: (json['stock_value'] as num).toDouble(),
  lowStockThreshold: (json['low_stock_threshold'] as num).toInt(),
  lowStockCount: (json['low_stock_count'] as num).toInt(),
  lowStockItems: (json['low_stock_items'] as List<dynamic>)
      .map((e) => LowStockItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  categoryBreakdown: (json['category_breakdown'] as List<dynamic>)
      .map((e) => CategoryBreakdownModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StockStatisticsModelToJson(
  _StockStatisticsModel instance,
) => <String, dynamic>{
  'total_products': instance.totalProducts,
  'total_quantity': instance.totalQuantity,
  'stock_value': instance.stockValue,
  'low_stock_threshold': instance.lowStockThreshold,
  'low_stock_count': instance.lowStockCount,
  'low_stock_items': instance.lowStockItems,
  'category_breakdown': instance.categoryBreakdown,
};

_LowStockItemModel _$LowStockItemModelFromJson(Map<String, dynamic> json) =>
    _LowStockItemModel(
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$LowStockItemModelToJson(_LowStockItemModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity': instance.quantity,
    };

_CategoryBreakdownModel _$CategoryBreakdownModelFromJson(
  Map<String, dynamic> json,
) => _CategoryBreakdownModel(
  categoryId: (json['category_id'] as num?)?.toInt(),
  categoryName: json['category_name'] as String,
  productCount: (json['product_count'] as num).toInt(),
  totalQuantity: (json['total_quantity'] as num).toInt(),
  categoryValue: (json['category_value'] as num).toDouble(),
);

Map<String, dynamic> _$CategoryBreakdownModelToJson(
  _CategoryBreakdownModel instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'product_count': instance.productCount,
  'total_quantity': instance.totalQuantity,
  'category_value': instance.categoryValue,
};
