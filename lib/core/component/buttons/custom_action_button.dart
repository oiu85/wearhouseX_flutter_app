import '../../constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? svgPath;
  final IconData? icon;

  const CustomActionButton({
    super.key,
    required this.onTap,
    this.svgPath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: ShapeDecoration(
          color: AppColors.actionButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Center(
          child: svgPath != null
              ? SvgPicture.asset(
                  svgPath!,
                  width: 24.sp,
                  height: 24.sp,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(
                  icon ?? Icons.chat_bubble_outline,
                  size: 24.sp,
                  color: theme.colorScheme.secondary,
                ),
        ),
      ),
    );
  }
}

