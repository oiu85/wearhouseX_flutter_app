import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';

/// Banner showing information about failed submission items
class FailedItemsBanner extends StatelessWidget {
  final int successfulSubmissions;
  final int totalSubmissions;

  const FailedItemsBanner({
    super.key,
    required this.successfulSubmissions,
    required this.totalSubmissions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (successfulSubmissions == 0 || successfulSubmissions >= totalSubmissions) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colorScheme.error.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_rounded,
            color: colorScheme.error,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: AppText(
              LocaleKeys.stockRequest_someRequestsFailed,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
