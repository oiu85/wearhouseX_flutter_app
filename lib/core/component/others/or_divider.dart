import '../../constant/app_colors.dart';
import '../../localization/app_text.dart';
import '../../localization/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Divider widget with "OR" text in the middle
/// Commonly used before social login options
class OrDivider extends StatelessWidget {
  /// Optional custom text instead of localized "OR"
  final String? text;

  /// Optional divider color
  final Color? dividerColor;

  /// Optional text color
  final Color? textColor;

  const OrDivider({
    super.key,
    this.text,
    this.dividerColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final divider = dividerColor ?? (isDark ? AppColors.darkDivider : AppColors.lightDivider);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(
      color: textColor ?? theme.colorScheme.onSurface,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: divider,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AppText(
            text ?? LocaleKeys.auth_or,
            style: textStyle,
          ),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            color: divider,
          ),
        ),
      ],
    );
  }
}

