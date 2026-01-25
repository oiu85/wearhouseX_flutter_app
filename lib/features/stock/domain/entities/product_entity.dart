import 'category_entity.dart';

/// Product entity representing a product
class ProductEntity {
  final int id;
  final String name;
  final double price;
  final int categoryId;
  final String? description;
  final String? image;
  final CategoryEntity? category;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    this.description,
    this.image,
    this.category,
  });
}
