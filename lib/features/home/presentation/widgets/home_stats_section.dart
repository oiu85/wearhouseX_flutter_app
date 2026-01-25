import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../domain/entities/driver_stats_entity.dart';

//* Statistics cards section widget
class HomeStatsSection extends StatelessWidget {
  final DriverStatsEntity stats;

  const HomeStatsSection({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Stats Grid
          GridView.count(
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
                'home.totalSales',
                '${stats.totalSales}',
                Icons.shopping_cart,
                theme.colorScheme.primary,
              ),
              _buildStatCard(
                context,
                theme,
                'home.totalRevenue',
                '\$${stats.totalRevenue.toStringAsFixed(2)}',
                Icons.attach_money,
                theme.colorScheme.secondary,
              ),
              _buildStatCard(
                context,
                theme,
                'home.todaySales',
                '${stats.todaySales}',
                Icons.today,
                theme.colorScheme.tertiary,
              ),
              _buildStatCard(
                context,
                theme,
                'home.todayRevenue',
                '\$${stats.todayRevenue.toStringAsFixed(2)}',
                Icons.trending_up,
                theme.colorScheme.tertiary,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Stock Items Card
          _buildStatCard(
            context,
            theme,
            'home.stockItems',
            '${stats.totalStockItems}',
            Icons.inventory_2,
            theme.colorScheme.primaryContainer,
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    ThemeData theme,
    String titleKey,
    String value,
    IconData icon,
    Color color, {
    bool fullWidth = false,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 24.sp),
              ],
            ),
            SizedBox(height: 8.h),
            AppText(
              titleKey,
              translation: true,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 4.h),
            AppText(
              value,
              translation: false,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
