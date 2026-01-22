import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BottomSheetItemIconType { dropdown, radio }

class CustomBottomSheetItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final BottomSheetItemIconType iconType;
  final bool isSelected;

  const CustomBottomSheetItem({
    super.key,
    required this.label,
    required this.onTap,
    this.iconType = BottomSheetItemIconType.dropdown,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: extensionColors.shadow.withValues(alpha: 0.40),
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Label Text
            Expanded(
              child: AppText(
                label,
                textAlign: TextAlign.right,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isSelected 
                      ? extensionColors.black 
                      : extensionColors.catalogTextColor,
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  height: 1.40,
                  letterSpacing: 0.20,
                ),
              ),
            ),
            //* Icon (Dropdown or Radio)
            _buildIcon(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;
    
    if (iconType == BottomSheetItemIconType.radio) {
      return Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: isSelected ? theme.colorScheme.secondary : extensionColors.tabInactiveColor,
        size: 24.sp,
      );
    }
    return Icon(
      Icons.keyboard_arrow_down,
      color: extensionColors.tabInactiveColor,
      size: 24.sp,
    );
  }
}

