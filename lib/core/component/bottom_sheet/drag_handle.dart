import '../../theme/app_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return Container(
      width: 48.w,
      height: 4.h,
      decoration: ShapeDecoration(
        color: extensionColors.campaignTitleColor.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}

