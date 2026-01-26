// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockRequestModel _$StockRequestModelFromJson(Map<String, dynamic> json) =>
    _StockRequestModel(
      id: _intFromJson(json['id']),
      productId: _intFromJson(json['product_id']),
      productName: json['product_name'] as String,
      quantity: _intFromJson(json['quantity']),
      status: json['status'] as String,
      rejectionReason: json['rejection_reason'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$StockRequestModelToJson(_StockRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'status': instance.status,
      'rejection_reason': instance.rejectionReason,
      'created_at': instance.createdAt,
    };
