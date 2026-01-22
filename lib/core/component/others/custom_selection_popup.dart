import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomSelectionPopup extends StatelessWidget {
  final String title;
  final List<SelectionOption> options;

  const CustomSelectionPopup({
    super.key,
    required this.title,
    required this.options,
  });

  /// Show the selection popup dialog
  static Future<void> show(
    BuildContext context, {
    required String title,
    required List<SelectionOption> options,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CustomSelectionPopup(
        title: title,
        options: options,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //* Title
            AppText(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),

            SizedBox(height: 24.h),

            //* Options
            ...options.map((option) {
              final index = options.indexOf(option);
              return Column(
                children: [
                  if (index > 0) SizedBox(height: 12.h),
                  _SelectionOptionWidget(option: option),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// Selection option data model
class SelectionOption {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;
  final String? subtitle;

  const SelectionOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.subtitle,
  });
}

/// Internal widget for displaying a single selection option
class _SelectionOptionWidget extends StatelessWidget {
  final SelectionOption option;

  const _SelectionOptionWidget({
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return InkWell(
      onTap: option.onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: option.isSelected
              ? theme.colorScheme.secondary.withValues(alpha: 0.10)
              : extensionColors.catalogBackground,
          border: Border.all(
            color: option.isSelected
                ? theme.colorScheme.secondary
                : extensionColors.divider.withValues(alpha: 0.30),
            width: option.isSelected ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            //* Icon (optional)
            if (option.icon != null) ...[
              Icon(
                option.icon,
                size: 24.sp,
                color: option.isSelected
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.onSurface,
              ),
              SizedBox(width: 12.w),
            ],

            //* Label and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    option.label,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight:
                          option.isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: option.isSelected
                          ? theme.colorScheme.secondary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                  if (option.subtitle != null) ...[
                    SizedBox(height: 4.h),
                    AppText(
                      option.subtitle!,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(width: 12.w),

            //* Check Icon (if selected)
            if (option.isSelected)
              Icon(
                Icons.check_circle,
                size: 24.sp,
                color: theme.colorScheme.secondary,
              )
            else
              Icon(
                Icons.circle_outlined,
                size: 24.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
          ],
        ),
      ),
    );
  }
}
