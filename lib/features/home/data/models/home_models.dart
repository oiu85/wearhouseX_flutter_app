import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/stock_item_entity.dart';

part 'home_models.freezed.dart';
part 'home_models.g.dart';

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
    @JsonKey(name: 'price') required String priceString,
    @JsonKey(name: 'category_id') required int categoryId,
    String? description,
    String? image,
    CategoryModel? category,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

/// Extension to convert ProductModel to ProductEntity
extension ProductModelExtension on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: double.tryParse(priceString) ?? 0.0,
      categoryId: categoryId,
      description: description,
      image: image,
      category: category?.toEntity(),
    );
  }
}

/// Stock item model
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
