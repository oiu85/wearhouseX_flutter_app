import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_colors.dart';

class CustomFavouriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? borderRadius;
  final Color? activeBackgroundColor;
  final Color? activeIconColor;
  final Color? inactiveBackgroundColor;
  final Color? inactiveIconColor;
  final IconData? activeIcon;
  final IconData? inactiveIcon;
  final String? tooltip;
  const CustomFavouriteButton({
    super.key,
    required this.isFavorite,
    this.onTap,
    this.width,
    this.height,
    this.iconSize,
    this.borderRadius,
    this.activeBackgroundColor,
    this.activeIconColor,
    this.inactiveBackgroundColor,
    this.inactiveIconColor,
    this.activeIcon,
    this.inactiveIcon,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    //* These are static theme-independent colors, so we keep using AppColors
    final button = InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
      child: Container(
        width: width ?? 40.w,
        height: height ?? 32.h,
        decoration: ShapeDecoration(
          color: isFavorite
              ? (activeBackgroundColor ?? AppColors.favoriteActiveBackground)
              : (inactiveBackgroundColor ?? AppColors.actionButtonBackground),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
        ),
        child: Center(
          child: Icon(
            isFavorite
                ? (activeIcon ?? Icons.favorite)
                : (inactiveIcon ?? Icons.favorite_border),
            size: iconSize ?? 24.sp,
            color: isFavorite
                ? (activeIconColor ?? AppColors.favoriteActiveIcon)
                : (inactiveIconColor ?? AppColors.actionButtonIcon),
          ),
        ),
      ),
    );

    //* Wrap with tooltip if provided
    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }
}


