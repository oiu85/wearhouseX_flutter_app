import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/routing/app_routes.dart';

//* Settings section widget
class MenuSettingsSection extends StatelessWidget {
  const MenuSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingItem(
            context,
            theme,
            icon: Icons.language,
            title: 'menu.language',
            subtitle: 'menu.changeAppLanguage',
            onTap: () {
              //* Navigate to settings page
              context.push(AppRoutes.settings);
            },
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
          _buildSettingItem(
            context,
            theme,
            icon: Icons.dark_mode,
            title: 'menu.theme',
            subtitle: 'menu.lightDarkMode',
            onTap: () {
              //* Navigate to settings page
              context.push(AppRoutes.settings);
            },
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
          _buildSettingItem(
            context,
            theme,
            icon: Icons.notifications,
            title: 'menu.notifications',
            subtitle: 'menu.manageNotifications',
            onTap: () {
              //* Navigate to notifications page
              context.push(AppRoutes.notifications);
            },
          ),
          Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
          _buildSettingItem(
            context,
            theme,
            icon: Icons.inventory_2,
            title: 'Request Stock',
            subtitle: 'Request stock from admin',
            onTap: () {
              //* Navigate to stock request page
              context.push(AppRoutes.stockRequest);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    ThemeData theme, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: AppText(
        title,
        translation: true,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
      ),
      subtitle: AppText(
        subtitle,
        translation: true,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: theme.colorScheme.onSurface.withOpacity(0.5),
      ),
      onTap: onTap,
    );
  }
}
