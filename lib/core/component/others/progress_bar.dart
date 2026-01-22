import '../../constant/app_colors.dart';
import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import '../../localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProgressBar extends StatelessWidget {
  final double paidAmount;
  final double totalAmount;
  final double? fontSize;
  final double? barHeight;

  const ProgressBar({
    super.key,
    required this.paidAmount,
    required this.totalAmount,
    this.fontSize,
    this.barHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;
    final remainingAmount = totalAmount - paidAmount;
    final progressPercentage = (paidAmount / totalAmount).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //* Paid and Remaining amounts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Paid amount
            AppText(
              '${LocaleKeys.campaign_paid.tr()} \$ ${paidAmount.toStringAsFixed(0)}',
              translation: false,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                fontSize: fontSize ?? 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            //* Remaining amount
            AppText(
              '${LocaleKeys.campaign_remaining.tr()} \$ ${remainingAmount.toStringAsFixed(0)}',
              translation: false,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                fontSize: fontSize ?? 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        //* Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            height: barHeight ?? 12.h,
            child: LinearProgressIndicator(
              value: progressPercentage,
              backgroundColor: extensionColors.progressBarUnfilled,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.progressBarFilled),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}

