
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/app_text.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.padding,
    this.icon,
    this.iconColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveOnPressed = isLoading ? null : onPressed;
    final buttonColor = (isLoading || effectiveOnPressed == null)
        ? (backgroundColor ?? const Color(0xFF0D9D57)).withOpacity(0.6)
        : (backgroundColor ?? const Color(0xFF0D9D57));
    
    return InkWell(
      onTap: effectiveOnPressed,
      child: Container(
        width: width ?? 342.w,
        height: height ?? 40.h,
        decoration: ShapeDecoration(
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 20.r,
            ),
          ),
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading) ...[
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
            ],
            if (!isLoading) ...[
              AppText(
                text,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w700,
                  height: 1.40,
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 10.w),
                Icon(
                  icon,
                  size: 20.w,
                  color: iconColor ?? Colors.white,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

