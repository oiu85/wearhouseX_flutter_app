import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';

class CustomBackButtonFilled extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;

  const CustomBackButtonFilled({
    super.key,
    this.onTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      borderRadius: BorderRadius.circular((size ?? 37.w) / 2),
      child: Container(
        width: size ?? 37.w,
        height: size ?? 37.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0x33838589),
              blurRadius: 4.r,
              offset: Offset(2.w, 4.h),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Assets.images.svg.icons.backButtonFilled.svg(
          width: size ?? 37.w,
          height: size ?? 37.w,
        ),
      ),
    );
  }
}

