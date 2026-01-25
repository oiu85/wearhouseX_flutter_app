import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/sales_state.dart';

/// Order summary widget with modern card design
class OrderSummaryWidget extends StatelessWidget {
  final CreateSaleState state;

  const OrderSummaryWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            LocaleKeys.sales_orderSummary,
            translation: true,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                LocaleKeys.sales_totalItems,
                translation: true,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  fontSize: 14.sp,
                ),
              ),
              AppText(
                '${state.totalItems}',
                translation: false,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(
            color: theme.colorScheme.onSurface.withOpacity(0.2),
            height: 1,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                LocaleKeys.sales_totalAmount,
                translation: true,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              AppText(
                '\$${state.totalAmount.toStringAsFixed(2)}',
                translation: false,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
