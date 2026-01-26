import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';

/// Header widget for multi-select dropdown
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectHeader extends StatelessWidget {
  final CreateSaleState saleState;
  final VoidCallback onToggleExpanded;

  const CartMultiSelectHeader({
    super.key,
    required this.saleState,
    required this.onToggleExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onToggleExpanded,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Icon(
              Icons.add_shopping_cart_rounded,
              color: theme.colorScheme.primary,
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppText(
                LocaleKeys.sales_fastSelect,
                translation: true,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            if (saleState.selectedProductIds.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: AppText(
                  '${saleState.selectedProductIds.length}',
                  translation: false,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(width: 8.w),
            Icon(
              saleState.isMultiSelectExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: theme.colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
