import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../domain/entities/stock_item_entity.dart';

/// Product info section widget with modern card design
class StockDetailInfoSection extends StatelessWidget {
  final StockItemEntity stockItem;

  const StockDetailInfoSection({
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
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Product Name
          AppText(
            stockItem.product.name,
            translation: false,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              fontSize: 22.sp,
              height: 1.3,
            ),
          ),
          SizedBox(height: 12.h),

          //* Category Badge
          if (stockItem.product.category != null)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: AppText(
                stockItem.product.category!.name,
                translation: false,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ),
          SizedBox(height: 16.h),

          //* Description
          if (stockItem.product.description != null &&
              stockItem.product.description!.isNotEmpty)
            AppText(
              stockItem.product.description!,
              translation: false,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
                height: 1.5,
                fontSize: 14.sp,
              ),
            )
          else
            AppText(
              'stockDetail.noDescription',
              translation: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                fontStyle: FontStyle.italic,
                fontSize: 14.sp,
              ),
            ),
        ],
      ),
    );
  }
}
