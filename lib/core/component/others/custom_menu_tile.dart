import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMenuTile extends StatelessWidget {
  final String text;
  final String? subtitle;
  final VoidCallback? onTap;
  final String? svgPath;
  final IconData? icon;
  final Color? iconColor;

  const CustomMenuTile({
    super.key,
    required this.text,
    this.subtitle,
    required this.onTap,
    this.svgPath,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        height: 67.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          shadows: [
            BoxShadow(
              color: extensionColors.divider.withValues(alpha: 0.20),
              blurRadius: 4.r,
              offset: Offset(0, 4.h),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

           //* Icon Container (right side for RTL)
              Container(
                width: 37.w,
                height: 34.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: extensionColors.catalogBackground,
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
                            iconColor ?? theme.colorScheme.secondary,
                            BlendMode.srcIn,
                          ),
                        )
                      : Icon(
                          icon ?? Icons.menu,
                          size: 24.sp,
                          color: iconColor ?? extensionColors.black,
                        ),
                ),
              ),

              //* Title and Subtitle (center)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Title
                      AppText(
                        text,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                          color: extensionColors.black,
                        ),
                      ),
                      
                      //* Subtitle (if provided)
                      if (subtitle != null) ...[
                        SizedBox(height: 6.h),
                        AppText(
                          subtitle!,
                          textAlign: TextAlign.right,
                          translation: true,
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                            color: const Color(0xFFA2A1A1), // Matches Figma design
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              
       
                           Icon(
                  Icons.arrow_forward_ios,
                  size: 24.sp,
                  color: extensionColors.black,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

