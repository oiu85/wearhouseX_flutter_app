
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../localization/app_text.dart';
import '../../theme/app_color_extension.dart';

class SelectionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? fontSize;

  const SelectionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: width ?? 108.w,
        height: height ?? 33.h,
        decoration: ShapeDecoration(
          color: isSelected ? theme.colorScheme.secondary.withOpacity(0.1) : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? theme.colorScheme.secondary : extensionColors.chipBorderInactive,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Center(
          child: AppText(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: extensionColors.black,
              fontSize: fontSize ?? 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
          ),
        ),
      ),
    );
  }
}

