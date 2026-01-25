// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverStatsModel _$DriverStatsModelFromJson(Map<String, dynamic> json) =>
    _DriverStatsModel(
      totalSales: _intFromJson(json['total_sales']),
      totalRevenue: _doubleFromJson(json['total_revenue']),
      todaySales: _intFromJson(json['today_sales']),
      todayRevenue: _doubleFromJson(json['today_revenue']),
      totalStockItems: _intFromJson(json['total_stock_items']),
      recentSales:
          (json['recent_sales'] as List<dynamic>?)
              ?.map((e) => SaleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DriverStatsModelToJson(_DriverStatsModel instance) =>
    <String, dynamic>{
      'total_sales': instance.totalSales,
      'total_revenue': instance.totalRevenue,
      'today_sales': instance.todaySales,
      'today_revenue': instance.todayRevenue,
      'total_stock_items': instance.totalStockItems,
      'recent_sales': instance.recentSales,
    };

_SaleItemModel _$SaleItemModelFromJson(Map<String, dynamic> json) =>
    _SaleItemModel(
      productName: json['product_name'] as String,
      quantity: _intFromJson(json['quantity']),
      price: _doubleFromJson(json['price']),
      subtotal: _doubleFromJson(json['subtotal']),
    );

Map<String, dynamic> _$SaleItemModelToJson(_SaleItemModel instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'price': instance.price,
      'subtotal': instance.subtotal,
    };

_SaleModel _$SaleModelFromJson(Map<String, dynamic> json) => _SaleModel(
  id: _intFromJson(json['id']),
  invoiceNumber: json['invoice_number'] as String,
  customerName: json['customer_name'] as String,
  totalAmount: _doubleFromJson(json['total_amount']),
  createdAt: json['created_at'] as String,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SaleItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SaleModelToJson(_SaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_number': instance.invoiceNumber,
      'customer_name': instance.customerName,
      'total_amount': instance.totalAmount,
      'created_at': instance.createdAt,
      'items': instance.items,
    };

_DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    _DashboardModel(
      quickStats: QuickStatsModel.fromJson(
        json['quick_stats'] as Map<String, dynamic>,
      ),
      recentSales:
          (json['recent_sales'] as List<dynamic>?)
              ?.map((e) => SaleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lowStockProducts:
          (json['low_stock_products'] as List<dynamic>?)
              ?.map(
                (e) => LowStockProductModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DashboardModelToJson(_DashboardModel instance) =>
    <String, dynamic>{
      'quick_stats': instance.quickStats,
      'recent_sales': instance.recentSales,
      'low_stock_products': instance.lowStockProducts,
    };

_QuickStatsModel _$QuickStatsModelFromJson(Map<String, dynamic> json) =>
    _QuickStatsModel(
      todaySales: _intFromJson(json['today_sales']),
      todayRevenue: _doubleFromJson(json['today_revenue']),
      availableProducts: _intFromJson(json['available_products']),
      lowStockAlerts: _intFromJson(json['low_stock_alerts']),
    );

Map<String, dynamic> _$QuickStatsModelToJson(_QuickStatsModel instance) =>
    <String, dynamic>{
      'today_sales': instance.todaySales,
      'today_revenue': instance.todayRevenue,
      'available_products': instance.availableProducts,
      'low_stock_alerts': instance.lowStockAlerts,
    };

_LowStockProductModel _$LowStockProductModelFromJson(
  Map<String, dynamic> json,
) => _LowStockProductModel(
  productId: _intFromJson(json['product_id']),
  productName: json['product_name'] as String,
  productImage: json['product_image'] as String?,
  category: json['category'] as String?,
  quantity: _intFromJson(json['quantity']),
  price: _doubleFromJson(json['price']),
  stockValue: _doubleFromJson(json['stock_value']),
);

Map<String, dynamic> _$LowStockProductModelToJson(
  _LowStockProductModel instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_image': instance.productImage,
  'category': instance.category,
  'quantity': instance.quantity,
  'price': instance.price,
  'stock_value': instance.stockValue,
};
