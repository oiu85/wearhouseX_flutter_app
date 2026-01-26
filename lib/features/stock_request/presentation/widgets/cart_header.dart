import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';

/// Cart header with item count and clear all button
class CartHeader extends StatelessWidget {
  final int itemCount;
  final int totalQuantity;
  final VoidCallback? onClearAll;

  const CartHeader({
    super.key,
    required this.itemCount,
    required this.totalQuantity,
    this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          Icon(
            Icons.shopping_cart_rounded,
            color: colorScheme.primary,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleKeys.stockRequest_productList,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                if (itemCount > 0)
                  AppText(
                    '$itemCount ${LocaleKeys.stockRequest_productList.tr()} • $totalQuantity ${LocaleKeys.stockRequest_units.tr()}',
                    translation: false,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
              ],
            ),
          ),
          if (itemCount > 0 && onClearAll != null)
            TextButton.icon(
              onPressed: onClearAll,
              icon: Icon(Icons.clear_all_rounded, size: 18.sp),
              label: AppText(
                LocaleKeys.app_delete,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.error,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.error,
              ),
            ),
        ],
      ),
    );
  }
}
