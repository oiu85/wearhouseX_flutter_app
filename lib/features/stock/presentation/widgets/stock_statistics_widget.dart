import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../domain/entities/stock_statistics_entity.dart';

/// Stock statistics widget displaying key metrics
class StockStatisticsWidget extends StatelessWidget {
  final StockStatisticsEntity statistics;

  const StockStatisticsWidget({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'stock.statistics',
            translation: true,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  'stock.totalProducts',
                  '${statistics.totalProducts}',
                  theme.colorScheme.primary,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildStatCard(
                  context,
                  'stock.totalQuantity',
                  '${statistics.totalQuantity}',
                  theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  'stock.stockValue',
                  '\$${statistics.stockValue.toStringAsFixed(2)}',
                  theme.colorScheme.tertiary,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildStatCard(
                  context,
                  'stock.lowStockAlerts',
                  '${statistics.lowStockCount}',
                  statistics.lowStockCount > 0
                      ? theme.colorScheme.error
                      : theme.colorScheme.primaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            label,
            translation: true,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 4.h),
          AppText(
            value,
            translation: false,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
