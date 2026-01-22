import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;

  const CustomBackButton({
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
        ),
        child: Assets.images.svg.icons.backButton.svg(
          width: size ?? 37.w,
          height: size ?? 37.w,
        ),
      ),
    );
  }
}

