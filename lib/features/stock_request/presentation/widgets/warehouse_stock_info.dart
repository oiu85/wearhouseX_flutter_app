import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';

/// Displays warehouse stock information for selected product
class WarehouseStockInfo extends StatelessWidget {
  final int? warehouseStock;

  const WarehouseStockInfo({
    super.key,
    required this.warehouseStock,
  });

  @override
  Widget build(BuildContext context) {
    if (warehouseStock == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: warehouseStock! > 0
            ? colorScheme.primaryContainer.withOpacity(0.3)
            : colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: warehouseStock! > 0
              ? colorScheme.primary.withOpacity(0.3)
              : colorScheme.error.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warehouse_rounded,
            color: warehouseStock! > 0
                ? colorScheme.primary
                : colorScheme.error,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleKeys.stockRequest_warehouseStock,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                AppText(
                  '$warehouseStock ${LocaleKeys.stockRequest_units.tr()}',
                  translation: false,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: warehouseStock! > 0
                        ? colorScheme.primary
                        : colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
