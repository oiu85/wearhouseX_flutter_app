/// Sale statistics entity
class SaleStatisticsEntity {
  final AllTimeStatsEntity allTime;
  final PeriodStatsEntity today;
  final PeriodStatsEntity week;
  final PeriodStatsEntity month;
  final double averageSaleAmount;
  final List<TopProductEntity> topProducts;

  const SaleStatisticsEntity({
    required this.allTime,
    required this.today,
    required this.week,
    required this.month,
    required this.averageSaleAmount,
    required this.topProducts,
  });
}

/// All-time statistics
class AllTimeStatsEntity {
  final int totalSales;
  final double totalRevenue;

  const AllTimeStatsEntity({
    required this.totalSales,
    required this.totalRevenue,
  });
}

/// Period statistics (today, week, month)
class PeriodStatsEntity {
  final int salesCount;
  final double revenue;

  const PeriodStatsEntity({
    required this.salesCount,
    required this.revenue,
  });
}

/// Top product entity
class TopProductEntity {
  final int productId;
  final String productName;
  final int quantitySold;
  final double revenue;

  const TopProductEntity({
    required this.productId,
    required this.productName,
    required this.quantitySold,
    required this.revenue,
  });
}
