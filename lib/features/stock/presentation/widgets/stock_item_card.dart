import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../domain/entities/stock_item_entity.dart';

/// Stock item card widget
class StockItemCard extends StatelessWidget {
  final StockItemEntity stockItem;
  final VoidCallback? onTap;

  const StockItemCard({
    super.key,
    required this.stockItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: stockItem.product.image != null &&
                          stockItem.product.image!.isNotEmpty
                      ? Image.network(
                          stockItem.product.image!,
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildPlaceholderImage(context);
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 80.w,
                              height: 80.h,
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        )
                      : _buildPlaceholderImage(context),
                ),
                SizedBox(width: 16.w),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      AppText(
                        stockItem.product.name,
                        translation: false,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                          fontSize: 15.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      // Category Badge
                      if (stockItem.product.category != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: AppText(
                            stockItem.product.category!.name,
                            translation: false,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      SizedBox(height: 12.h),
                      // Quantity and Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Available Quantity
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                LocaleKeys.home_availableQuantity,
                                translation: true,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                  fontSize: 11.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              AppText(
                                '${stockItem.quantity}',
                                translation: false,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                          // Price per Unit
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                LocaleKeys.home_pricePerUnit,
                                translation: true,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                  fontSize: 11.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              AppText(
                                '\$${stockItem.product.price.toStringAsFixed(2)}',
                                translation: false,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.secondary,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurface.withOpacity(0.3),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.inventory_2_rounded,
        size: 40.sp,
        color: theme.colorScheme.onSurface.withOpacity(0.3),
      ),
    );
  }
}
