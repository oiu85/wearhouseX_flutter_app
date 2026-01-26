import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';

/// Fast select button that opens multi-select bottom sheet
class CartFastSelectButton extends StatelessWidget {
  final VoidCallback onTap;

  const CartFastSelectButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomFilledButton(
      text: LocaleKeys.sales_fastSelect,
      onPressed: onTap,
      backgroundColor: theme.colorScheme.secondary,
      textColor: theme.colorScheme.onSecondary,
      icon: Icons.add_shopping_cart_rounded,
      height: 48.h,
      borderRadius: 12.r,
    );
  }
}
