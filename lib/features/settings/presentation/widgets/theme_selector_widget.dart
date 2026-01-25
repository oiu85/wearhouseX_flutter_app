import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';

/// Theme selector widget
class ThemeSelectorWidget extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const ThemeSelectorWidget({
    super.key,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: theme.colorScheme.primary,
                ),
                SizedBox(width: 12.w),
                AppText(
                  LocaleKeys.settings_theme,
                  translation: true,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
          RadioListTile<ThemeMode>(
            title: AppText(
              'Light',
              translation: false,
            ),
            value: ThemeMode.light,
            groupValue: currentThemeMode,
            onChanged: (mode) {
              if (mode != null) {
                onThemeModeChanged(mode);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: AppText(
              'Dark',
              translation: false,
            ),
            value: ThemeMode.dark,
            groupValue: currentThemeMode,
            onChanged: (mode) {
              if (mode != null) {
                onThemeModeChanged(mode);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: AppText(
              'System',
              translation: false,
            ),
            value: ThemeMode.system,
            groupValue: currentThemeMode,
            onChanged: (mode) {
              if (mode != null) {
                onThemeModeChanged(mode);
              }
            },
          ),
        ],
      ),
    );
  }
}
