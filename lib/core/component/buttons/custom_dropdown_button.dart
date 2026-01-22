import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? svgPath;
  final IconData? icon;

  const CustomDropdownButton({
    super.key,
    required this.text,
    required this.onTap,
    this.svgPath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        splashColor: theme.colorScheme.secondary.withValues(alpha: 0.15),
        highlightColor: theme.colorScheme.secondary.withValues(alpha: 0.08),
        child: Container(
          width: 125.w,
          height: 67.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.secondary.withValues(alpha: 0.08),
                theme.colorScheme.secondary.withValues(alpha: 0.12),
              ],
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* Icon (optional)
              if (svgPath != null || icon != null)
                if (svgPath != null)
                  SvgPicture.asset(
                    svgPath!,
                    width: 28.sp,
                    height: 28.sp,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.secondary,
                      BlendMode.srcIn,
                    ),
                  )
                else
                  Icon(
                    icon,
                    size: 28.sp,
                    color: theme.colorScheme.secondary,
                  ),
              
              if (svgPath != null || icon != null) SizedBox(height: 6.h),
              
              //* Text
              AppText(
                text,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

