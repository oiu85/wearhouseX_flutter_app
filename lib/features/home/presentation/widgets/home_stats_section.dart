import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../domain/entities/driver_stats_entity.dart';

/// Statistics cards section widget with modern design
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
                LocaleKeys.home_totalSales,
                '${stats.totalSales}',
                Icons.shopping_cart_rounded,
                theme.colorScheme.primary,
              ),
              _buildStatCard(
                context,
                theme,
                LocaleKeys.home_totalRevenue,
                '\$${stats.totalRevenue.toStringAsFixed(2)}',
                Icons.attach_money_rounded,
                theme.colorScheme.secondary,
              ),
              _buildStatCard(
                context,
                theme,
                LocaleKeys.home_todaySales,
                '${stats.todaySales}',
                Icons.today_rounded,
                theme.colorScheme.tertiary,
              ),
              _buildStatCard(
                context,
                theme,
                LocaleKeys.home_todayRevenue,
                '\$${stats.todayRevenue.toStringAsFixed(2)}',
                Icons.trending_up_rounded,
                theme.colorScheme.tertiary,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Stock Items Card
          _buildStatCard(
            context,
            theme,
            LocaleKeys.home_stockItems,
            '${stats.totalStockItems}',
            Icons.inventory_2_rounded,
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
                      child: Icon(icon, color: color, size: 24.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                AppText(
                  titleKey,
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
          ),
        ),
      ),
    );
  }
}
