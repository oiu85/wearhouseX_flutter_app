import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../domain/entities/stock_request_cart_item.dart';

/// Cart item widget displaying product info with remove action
class StockRequestCartItemWidget extends StatelessWidget {
  final StockRequestCartItem item;
  final VoidCallback onRemove;

  const StockRequestCartItemWidget({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.inventory_2_rounded,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    item.productName,
                    translation: false,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.production_quantity_limits_rounded,
                        size: 14.sp,
                        color: colorScheme.primary,
                      ),
                      SizedBox(width: 4.w),
                      AppText(
                        '${item.quantity} ${LocaleKeys.stockRequest_units.tr()}',
                        translation: false,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.warehouse_rounded,
                        size: 14.sp,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                      SizedBox(width: 4.w),
                      AppText(
                        '${item.warehouseStock}',
                        translation: false,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: Icon(
                Icons.delete_rounded,
                color: colorScheme.error,
                size: 22.sp,
              ),
              style: IconButton.styleFrom(
                backgroundColor: colorScheme.errorContainer.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
