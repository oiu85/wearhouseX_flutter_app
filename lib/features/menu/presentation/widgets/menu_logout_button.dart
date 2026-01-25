import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';

//* Logout button widget
class MenuLogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const MenuLogoutButton({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomFilledButton(
        text: 'menu.logout'.tr(),
        onPressed: onLogout,
        width: double.infinity,
        backgroundColor: theme.colorScheme.error,
        textColor: theme.colorScheme.onError,
        icon: Icons.logout,
        height: 50.h,
      ),
    );
  }
}
