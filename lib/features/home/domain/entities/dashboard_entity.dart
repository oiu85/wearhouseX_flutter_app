import '../entities/sale_entity.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';

/// Dashboard entity
class DashboardEntity {
  final QuickStatsEntity quickStats;
  final List<SaleEntity> recentSales;
  final List<StockItemEntity> lowStockProducts;

  const DashboardEntity({
    required this.quickStats,
    required this.recentSales,
    required this.lowStockProducts,
  });
}

/// Quick stats entity
class QuickStatsEntity {
  final int todaySales;
  final double todayRevenue;
  final int availableProducts;
  final int lowStockAlerts;

  const QuickStatsEntity({
    required this.todaySales,
    required this.todayRevenue,
    required this.availableProducts,
    required this.lowStockAlerts,
  });
}
