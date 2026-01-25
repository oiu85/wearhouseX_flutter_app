import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';

/// Quantity selector widget with +/- buttons
class StockDetailQuantitySelector extends StatelessWidget {
  final int quantity;
  final int maxQuantity;
  final ValueChanged<int> onQuantityChanged;

  const StockDetailQuantitySelector({
    super.key,
    required this.quantity,
    required this.maxQuantity,
    required this.onQuantityChanged,
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
          AppText(
            LocaleKeys.stockDetail_availableQuantity,
            translation: true,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              //* Decrease button
              Container(
                decoration: BoxDecoration(
                  color: quantity > 1
                      ? theme.colorScheme.primary.withOpacity(0.15)
                      : theme.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: quantity > 1 ? () => onQuantityChanged(quantity - 1) : null,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        Icons.remove_rounded,
                        color: quantity > 1
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface.withOpacity(0.3),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              //* Quantity display
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: AppText(
                  '$quantity',
                  translation: false,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              //* Increase button
              Container(
                decoration: BoxDecoration(
                  color: quantity < maxQuantity
                      ? theme.colorScheme.primary.withOpacity(0.15)
                      : theme.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: quantity < maxQuantity
                        ? () => onQuantityChanged(quantity + 1)
                        : null,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        Icons.add_rounded,
                        color: quantity < maxQuantity
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface.withOpacity(0.3),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
