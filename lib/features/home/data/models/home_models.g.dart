// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

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

_StockItemModel _$StockItemModelFromJson(Map<String, dynamic> json) =>
    _StockItemModel(
      id: (json['id'] as num).toInt(),
      driverId: (json['driver_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StockItemModelToJson(_StockItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'product': instance.product,
    };
