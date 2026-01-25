import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/others/section_header.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/sale_entity.dart';

/// Recent sales list section widget with modern design
class HomeRecentSalesSection extends StatelessWidget {
  final List<SaleEntity> recentSales;
  final VoidCallback? onViewAll;
  final ValueChanged<SaleEntity>? onSaleTap;

  const HomeRecentSalesSection({
    super.key,
    required this.recentSales,
    this.onViewAll,
    this.onSaleTap,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSales.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: LocaleKeys.home_recentSales,
            actionText: onViewAll != null ? LocaleKeys.home_viewAllSales : null,
            onActionTap: onViewAll,
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentSales.length > 5 ? 5 : recentSales.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final sale = recentSales[index];
              return _buildSaleCard(context, sale);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSaleCard(BuildContext context, SaleEntity sale) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onSaleTap != null ? () => onSaleTap!(sale) : null,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.receipt_long_rounded,
                    color: theme.colorScheme.primary,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        sale.invoiceNumber,
                        translation: false,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      AppText(
                        sale.customerName,
                        translation: false,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      AppText(
                        DateFormatter.formatRelativeDate(sale.createdAt),
                        translation: false,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.5),
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      '\$${sale.totalAmount.toStringAsFixed(2)}',
                      translation: false,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.secondary,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurface.withOpacity(0.3),
                      size: 20.sp,
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
