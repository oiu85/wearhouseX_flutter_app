import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../domain/entities/stock_item_entity.dart';

/// Available quantity section widget with modern card design
class StockDetailQuantitySection extends StatelessWidget {
  final StockItemEntity stockItem;

  const StockDetailQuantitySection({
    super.key,
    required this.stockItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'stockDetail.availableQuantity',
                  translation: true,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                AppText(
                  '${stockItem.quantity}',
                  translation: false,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontSize: 32.sp,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              color: theme.colorScheme.primary,
              size: 32.sp,
            ),
          ),
        ],
      ),
    );
  }
}
