import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/others/section_header.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';

/// Low stock alerts section widget with modern alert design
class HomeLowStockSection extends StatelessWidget {
  final List<StockItemEntity> lowStockProducts;
  final VoidCallback? onViewAll;
  final ValueChanged<int>? onProductTap;

  const HomeLowStockSection({
    super.key,
    required this.lowStockProducts,
    this.onViewAll,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    if (lowStockProducts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: LocaleKeys.dashboard_lowStockAlerts,
            actionText: onViewAll != null ? LocaleKeys.dashboard_viewAll : null,
            onActionTap: onViewAll,
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lowStockProducts.length > 5 ? 5 : lowStockProducts.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final stockItem = lowStockProducts[index];
              return _buildLowStockCard(context, stockItem);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLowStockCard(
    BuildContext context,
    StockItemEntity stockItem,
  ) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.error.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.error.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onProductTap?.call(stockItem.productId),
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: theme.colorScheme.error,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        stockItem.product.name,
                        translation: false,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                          fontSize: 15.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: AppText(
                          '${stockItem.quantity} ${LocaleKeys.home_availableQuantity.tr().toLowerCase()}',
                          translation: false,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.error,
                            fontWeight: FontWeight.w700,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.error.withOpacity(0.5),
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
