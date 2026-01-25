import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';

/// Language selector widget
class LanguageSelectorWidget extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const LanguageSelectorWidget({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
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
                  Icons.language,
                  color: theme.colorScheme.primary,
                ),
                SizedBox(width: 12.w),
                AppText(
                  LocaleKeys.settings_language,
                  translation: true,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
          RadioListTile<Locale>(
            title: AppText(
              'English',
              translation: false,
            ),
            value: const Locale('en'),
            groupValue: currentLocale,
            onChanged: (locale) {
              if (locale != null) {
                onLocaleChanged(locale);
              }
            },
          ),
          RadioListTile<Locale>(
            title: AppText(
              'العربية',
              translation: false,
            ),
            value: const Locale('ar'),
            groupValue: currentLocale,
            onChanged: (locale) {
              if (locale != null) {
                onLocaleChanged(locale);
              }
            },
          ),
        ],
      ),
    );
  }
}
