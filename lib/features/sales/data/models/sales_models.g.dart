// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleItemModel _$SaleItemModelFromJson(Map<String, dynamic> json) =>
    _SaleItemModel(
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      quantity: _intFromJson(json['quantity']),
      price: _doubleFromJson(json['price']),
      subtotal: _doubleFromJson(json['subtotal']),
    );

Map<String, dynamic> _$SaleItemModelToJson(_SaleItemModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
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

_CreateSaleRequestModel _$CreateSaleRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateSaleRequestModel(
  customerName: json['customer_name'] as String,
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => CreateSaleItemRequestModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CreateSaleRequestModelToJson(
  _CreateSaleRequestModel instance,
) => <String, dynamic>{
  'customer_name': instance.customerName,
  'items': instance.items,
};

_CreateSaleItemRequestModel _$CreateSaleItemRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateSaleItemRequestModel(
  productId: (json['product_id'] as num).toInt(),
  quantity: _intFromJson(json['quantity']),
);

Map<String, dynamic> _$CreateSaleItemRequestModelToJson(
  _CreateSaleItemRequestModel instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'quantity': instance.quantity,
};

_SaleStatisticsModel _$SaleStatisticsModelFromJson(Map<String, dynamic> json) =>
    _SaleStatisticsModel(
      allTime: AllTimeStatsModel.fromJson(
        json['all_time'] as Map<String, dynamic>,
      ),
      today: PeriodStatsModel.fromJson(json['today'] as Map<String, dynamic>),
      week: PeriodStatsModel.fromJson(json['week'] as Map<String, dynamic>),
      month: PeriodStatsModel.fromJson(json['month'] as Map<String, dynamic>),
      averageSaleAmount: _doubleFromJson(json['average_sale_amount']),
      topProducts: (json['top_products'] as List<dynamic>)
          .map((e) => TopProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleStatisticsModelToJson(
  _SaleStatisticsModel instance,
) => <String, dynamic>{
  'all_time': instance.allTime,
  'today': instance.today,
  'week': instance.week,
  'month': instance.month,
  'average_sale_amount': instance.averageSaleAmount,
  'top_products': instance.topProducts,
};

_AllTimeStatsModel _$AllTimeStatsModelFromJson(Map<String, dynamic> json) =>
    _AllTimeStatsModel(
      totalSales: _intFromJson(json['total_sales']),
      totalRevenue: _doubleFromJson(json['total_revenue']),
    );

Map<String, dynamic> _$AllTimeStatsModelToJson(_AllTimeStatsModel instance) =>
    <String, dynamic>{
      'total_sales': instance.totalSales,
      'total_revenue': instance.totalRevenue,
    };

_PeriodStatsModel _$PeriodStatsModelFromJson(Map<String, dynamic> json) =>
    _PeriodStatsModel(
      salesCount: _intFromJson(json['sales_count']),
      revenue: _doubleFromJson(json['revenue']),
    );

Map<String, dynamic> _$PeriodStatsModelToJson(_PeriodStatsModel instance) =>
    <String, dynamic>{
      'sales_count': instance.salesCount,
      'revenue': instance.revenue,
    };

_TopProductModel _$TopProductModelFromJson(Map<String, dynamic> json) =>
    _TopProductModel(
      productId: _intFromJson(json['product_id']),
      productName: json['product_name'] as String,
      quantitySold: _intFromJson(json['quantity_sold']),
      revenue: _doubleFromJson(json['revenue']),
    );

Map<String, dynamic> _$TopProductModelToJson(_TopProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity_sold': instance.quantitySold,
      'revenue': instance.revenue,
    };
