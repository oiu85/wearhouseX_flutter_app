import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShareButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const CustomShareButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: ShapeDecoration(
          color: theme.colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.share_outlined,
              size: 24.sp,
              color: theme.colorScheme.onSecondary,
            ),
            SizedBox(width: 8.w),
            AppText(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSecondary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


