import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/bloc/profile_event.dart';
import '../bloc/menu_bloc.dart';
import '../bloc/menu_event.dart';
import '../bloc/menu_state.dart';
import '../widgets/menu_profile_section.dart';
import '../widgets/menu_settings_section.dart';
import '../widgets/menu_logout_button.dart';

//* Menu page displaying profile, settings, and logout
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MenuBloc _menuBloc = GetIt.I<MenuBloc>();

  @override
  void initState() {
    super.initState();
    _menuBloc.add(const LoadUserInfo());
  }

  void _handleLogout(BuildContext context) async {
    //* Use ProfileBloc for logout to ensure proper cleanup
    final profileBloc = GetIt.I<ProfileBloc>();
    profileBloc.add(const Logout());
    
    //* Listen for logout success
    profileBloc.stream.listen((state) {
      if (state.status.isSuccess() && context.mounted) {
        context.go(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _menuBloc,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: AppText(
            'menu.profile',
            translation: true,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<MenuBloc, MenuState>(
          bloc: _menuBloc,
          builder: (context, state) {
            return state.status.when(
              init: () => Center(
                child: CircularProgressIndicator(color: theme.colorScheme.primary),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(color: theme.colorScheme.primary),
              ),
              loadingMore: () => _buildContent(context, theme, state),
              success: () => _buildContent(context, theme, state),
              fail: (error) => UiHelperStatus(
                state: state.status,
                message: state.errorMessage,
                onRetry: () {
                  _menuBloc.add(const LoadUserInfo());
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, MenuState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //* Profile Section
          MenuProfileSection(userInfo: state.userInfo),

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
  }
}
