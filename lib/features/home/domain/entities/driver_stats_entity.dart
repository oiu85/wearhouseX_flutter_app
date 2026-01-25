/// Driver statistics entity
class DriverStatsEntity {
  final int totalSales;
  final double totalRevenue;
  final int todaySales;
  final double todayRevenue;
  final int totalStockItems;

  const DriverStatsEntity({
    required this.totalSales,
    required this.totalRevenue,
    required this.todaySales,
    required this.todayRevenue,
    required this.totalStockItems,
  });
}
