import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import '../widgets/language_selector_widget.dart';
import '../widgets/theme_selector_widget.dart';
import '../widgets/about_section_widget.dart';

/// Settings page
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsBloc _settingsBloc = GetIt.I<SettingsBloc>();

  @override
  void initState() {
    super.initState();
    _settingsBloc.add(const LoadPreferences());
  }

  @override
  void dispose() {
    _settingsBloc.add(const ResetSettings());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: AppText(
          LocaleKeys.settings_title,
          translation: true,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: _settingsBloc,
        builder: (context, state) {
          if (state.status.isLoading() || state.status.isInitial()) {
            return Center(
              child: CircularProgressIndicator(color: theme.colorScheme.primary),
            );
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language Selector
                LanguageSelectorWidget(
                  currentLocale: state.preferences?.locale ?? const Locale('ar'),
                  onLocaleChanged: (locale) {
                    _settingsBloc.add(UpdateLocale(locale));
                  },
                ),
                SizedBox(height: 24.h),
                // Theme Selector
                ThemeSelectorWidget(
                  currentThemeMode: state.preferences?.themeMode ?? ThemeMode.system,
                  onThemeModeChanged: (themeMode) {
                    _settingsBloc.add(UpdateThemeMode(themeMode));
                    // Notify MyApp to rebuild with new theme
                    // This will be handled by the main app listening to storage changes
                  },
                ),
                SizedBox(height: 24.h),
                // About Section
                const AboutSectionWidget(),
                SizedBox(height: 100.h), // Space for bottom nav
              ],
            ),
          );
        },
      ),
    );
  }
}
