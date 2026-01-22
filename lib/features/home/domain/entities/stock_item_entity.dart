import 'product_entity.dart';

/// Stock item entity representing a driver's stock item
class StockItemEntity {
  final int id;
  final int driverId;
  final int productId;
  final int quantity;
  final ProductEntity product;
  final DateTime? updatedAt;

  const StockItemEntity({
    required this.id,
    required this.driverId,
    required this.productId,
    required this.quantity,
    required this.product,
    this.updatedAt,
  });
}
