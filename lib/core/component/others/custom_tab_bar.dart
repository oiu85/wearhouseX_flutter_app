import '../../constant/app_colors.dart';
import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<TabItem> tabs;
  final ValueChanged<int> onTabChanged;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.tabs,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        final isActive = index == selectedIndex;

        return Expanded(
          child: InkWell(
            onTap: () => onTabChanged(index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //* Tab Content
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //* Icon or SVG
                      if (tab.svgPath != null)
                        SvgPicture.asset(
                          tab.svgPath!,
                          width: 20.sp,
                          height: 20.sp,
                          colorFilter: ColorFilter.mode(
                            isActive ? AppColors.tabActiveIndicator : extensionColors.tabInactiveColor,
                            BlendMode.srcIn,
                          ),
                        )
                      else if (tab.icon != null)
                        Icon(
                          tab.icon,
                          size: 20.sp,
                          color: isActive ? AppColors.tabActiveIndicator : extensionColors.tabInactiveColor,
                        ),
                      SizedBox(width: 2.w),
                      Flexible(
                        child: AppText(
                          isAutoScale: true,
                          tab.label,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isActive ? AppColors.tabActiveIndicator : extensionColors.tabInactiveColor,
                            fontSize: 12.sp,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  //* Centered Indicator
                  if (isActive)
                    Container(
                      width: 55.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: AppColors.tabActiveIndicator,
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                    )
                  else
                    SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class TabItem {
  final IconData? icon;
  final String? svgPath;
  final String label;

  const TabItem({
    this.icon,
    this.svgPath,
    required this.label,
  }) : assert(
          icon != null || svgPath != null,
          'TabItem must have either an icon or svgPath',
        );
}

