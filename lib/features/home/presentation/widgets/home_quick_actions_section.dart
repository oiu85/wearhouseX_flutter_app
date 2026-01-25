import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';

//* Quick actions section widget
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
          AppText(
            'home.quickActions',
            translation: true,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: CustomFilledButton(
                  text: 'home.createSale'.tr(),
                  onPressed: onCreateSale,
                  icon: Icons.add_shopping_cart,
                  height: 50.h,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomFilledButton(
                  text: 'home.viewStock'.tr(),
                  onPressed: onViewStock,
                  icon: Icons.inventory_2,
                  height: 50.h,
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  textColor: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
