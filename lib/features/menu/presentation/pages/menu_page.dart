import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../widgets/menu_profile_section.dart';
import '../widgets/menu_settings_section.dart';
import '../widgets/menu_logout_button.dart';

//* Menu page displaying profile, settings, and logout
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void _handleLogout(BuildContext context) async {
    //* Clear user data from storage
    final storageService = GetIt.I<AppStorageService>();
    await storageService.clearUserData();
    await storageService.setAccessToken(null);
    
    //* Navigate to login after logout
    if (context.mounted) {
      context.go('/auth/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final storageService = GetIt.I<AppStorageService>();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: AppText(
          'menu.profile',
          translation: true,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: storageService.getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: theme.colorScheme.primary),
            );
          }

          final userInfo = snapshot.data;

          return SingleChildScrollView(
            child: Column(
              children: [
                //* Profile Section
                MenuProfileSection(userInfo: userInfo),

                SizedBox(height: 24.h),

                //* Settings Section
                MenuSettingsSection(),

                SizedBox(height: 24.h),

                //* Logout Button
                MenuLogoutButton(onLogout: () => _handleLogout(context)),

                SizedBox(height: 100.h), //* Space for bottom nav bar
              ],
            ),
          );
        },
      ),
    );
  }
}
