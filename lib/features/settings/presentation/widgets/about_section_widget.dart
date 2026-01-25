import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';

/// About section widget
class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Get version from pubspec.yaml (hardcoded for now, can be replaced with package_info_plus if needed)
    const version = '1.0.0';
    const buildNumber = '1';

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.primary,
                ),
                SizedBox(width: 12.w),
                AppText(
                  LocaleKeys.settings_about,
                  translation: true,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
          ListTile(
            title: AppText(
              LocaleKeys.settings_version,
              translation: true,
            ),
            trailing: AppText(
              '$version ($buildNumber)',
              translation: false,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: AppText(
              'App Name',
              translation: false,
            ),
            trailing: AppText(
              'Driver App',
              translation: false,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
