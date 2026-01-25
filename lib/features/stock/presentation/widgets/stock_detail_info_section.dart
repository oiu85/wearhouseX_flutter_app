import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../domain/entities/stock_item_entity.dart';

//* Product info section widget (name, category, description)
class StockDetailInfoSection extends StatelessWidget {
  final StockItemEntity stockItem;

  const StockDetailInfoSection({
    super.key,
    required this.stockItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Product Name
          AppText(
            stockItem.product.name,
            translation: false,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 12.h),

          //* Category Badge
          if (stockItem.product.category != null)
            Chip(
              label: AppText(
                stockItem.product.category!.name,
                translation: false,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: theme.colorScheme.primaryContainer,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            ),
          SizedBox(height: 16.h),

          //* Description
          if (stockItem.product.description != null &&
              stockItem.product.description!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  stockItem.product.description!,
                  translation: false,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
              ],
            )
          else
            AppText(
              'stockDetail.noDescription',
              translation: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }
}
