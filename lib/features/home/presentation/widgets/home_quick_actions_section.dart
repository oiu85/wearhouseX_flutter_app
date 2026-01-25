import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/component/others/section_header.dart';
import '../../../../core/localization/locale_keys.g.dart';

/// Quick actions section widget with modern button layout
class HomeQuickActionsSection extends StatelessWidget {
  final VoidCallback? onCreateSale;
  final VoidCallback? onViewStock;
  final VoidCallback? onViewAllSales;

  const HomeQuickActionsSection({
    super.key,
    this.onCreateSale,
    this.onViewStock,
    this.onViewAllSales,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: LocaleKeys.home_quickActions,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: CustomFilledButton(
                  text: LocaleKeys.home_createSale,
                  onPressed: onCreateSale,
                  icon: Icons.add_shopping_cart_rounded,
                  height: 56.h,
                  borderRadius: 16.r,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomFilledButton(
                  text: LocaleKeys.home_viewStock,
                  onPressed: onViewStock,
                  icon: Icons.inventory_2_rounded,
                  height: 56.h,
                  borderRadius: 16.r,
                  fontSize: 15.sp,
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  textColor: theme.colorScheme.onSecondaryContainer,
                  iconColor: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
