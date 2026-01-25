import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';

//* Profile section widget
class MenuProfileSection extends StatelessWidget {
  final Map<String, dynamic>? userInfo;

  const MenuProfileSection({
    super.key,
    this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          //* Avatar
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
              size: 30.sp,
            ),
          ),
          SizedBox(width: 16.w),
          //* User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  userInfo?['name'] ?? 'auth.driver',
                  translation: userInfo?['name'] == null,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                AppText(
                  userInfo?['email'] ?? '',
                  translation: false,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 4.h),
                Chip(
                  label: AppText(
                    userInfo?['type'] ?? 'auth.driver',
                    translation: userInfo?['type'] == null,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.primaryContainer,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
