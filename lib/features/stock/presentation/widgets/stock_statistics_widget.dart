import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../domain/entities/stock_statistics_entity.dart';

/// Stock statistics widget displaying key metrics with modern card design
class StockStatisticsWidget extends StatelessWidget {
  final StockStatisticsEntity statistics;

  const StockStatisticsWidget({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.5,
        children: [
          _buildStatCard(
            context,
            theme,
            LocaleKeys.stock_totalProducts,
            '${statistics.totalProducts}',
            Icons.inventory_2_rounded,
            theme.colorScheme.primary,
          ),
          _buildStatCard(
            context,
            theme,
            LocaleKeys.stock_totalQuantity,
            '${statistics.totalQuantity}',
            Icons.numbers_rounded,
            theme.colorScheme.secondary,
          ),
          _buildStatCard(
            context,
            theme,
            LocaleKeys.stock_stockValue,
            '\$${statistics.stockValue.toStringAsFixed(2)}',
            Icons.attach_money_rounded,
            theme.colorScheme.tertiary,
          ),
          _buildStatCard(
            context,
            theme,
            LocaleKeys.stock_lowStockAlerts,
            '${statistics.lowStockCount}',
            Icons.warning_amber_rounded,
            statistics.lowStockCount > 0
                ? theme.colorScheme.error
                : theme.colorScheme.primaryContainer,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    ThemeData theme,
    String labelKey,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      labelKey,
                      translation: true,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    AppText(
                      value,
                      translation: false,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontSize: 20.sp,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
