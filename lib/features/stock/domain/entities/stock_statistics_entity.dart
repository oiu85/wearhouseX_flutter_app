import 'category_entity.dart';

/// Stock statistics entity
class StockStatisticsEntity {
  final int totalProducts;
  final int totalQuantity;
  final double stockValue;
  final int lowStockCount;
  final int lowStockThreshold;
  final List<LowStockItemEntity> lowStockItems;
  final List<CategoryBreakdownEntity> categoryBreakdown;

  const StockStatisticsEntity({
    required this.totalProducts,
    required this.totalQuantity,
    required this.stockValue,
    required this.lowStockCount,
    required this.lowStockThreshold,
    required this.lowStockItems,
    required this.categoryBreakdown,
  });
}

/// Low stock item entity
class LowStockItemEntity {
  final int productId;
  final String productName;
  final int quantity;

  const LowStockItemEntity({
    required this.productId,
    required this.productName,
    required this.quantity,
  });
}

/// Category breakdown entity
class CategoryBreakdownEntity {
  final int? categoryId;
  final String categoryName;
  final int productCount;
  final int totalQuantity;
  final double categoryValue;

  const CategoryBreakdownEntity({
    this.categoryId,
    required this.categoryName,
    required this.productCount,
    required this.totalQuantity,
    required this.categoryValue,
  });
}
