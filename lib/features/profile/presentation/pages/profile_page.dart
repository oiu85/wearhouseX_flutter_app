import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/status/ui_helper.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

/// Profile page
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileBloc _profileBloc = GetIt.I<ProfileBloc>();

  @override
  void initState() {
    super.initState();
    _profileBloc.add(const LoadProfile());
  }

  @override
  void dispose() {
    _profileBloc.add(const ResetProfile());
    super.dispose();
  }

  void _onLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText(
          LocaleKeys.profile_logout,
          translation: true,
        ),
        content: AppText(
          LocaleKeys.profile_logoutConfirm,
          translation: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: AppText(
              'Cancel',
              translation: false,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _profileBloc.add(const Logout());
            },
            child: AppText(
              LocaleKeys.profile_logout,
              translation: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      listener: (context, state) {
        if (state.status.isSuccess() && state.user == null) {
          // Logout successful, navigate to login
          context.go(AppRoutes.login);
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: AppText(
            LocaleKeys.profile_title,
            translation: true,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: _profileBloc,
          builder: (context, state) {
            if (state.status.isLoading() || state.status.isInitial()) {
              return Center(
                child: CircularProgressIndicator(color: theme.colorScheme.primary),
              );
            }

            if (state.status.isFail()) {
              return Center(
                child: UiHelperStatus(
                  state: state.status,
                  message: state.errorMessage,
                  onRetry: () {
                    _profileBloc.add(const LoadProfile());
                  },
                ),
              );
            }

            if (state.user == null) {
              return const SizedBox.shrink();
            }

            final user = state.user!;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24.h),
                  // Profile Picture Placeholder
                  Center(
                    child: Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primaryContainer,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 64.sp,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Name Card
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            LocaleKeys.profile_name,
                            translation: true,
                            style: theme.textTheme.bodyMedium,
                          ),
                          AppText(
                            user.name,
                            translation: false,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Email Card
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            LocaleKeys.profile_email,
                            translation: true,
                            style: theme.textTheme.bodyMedium,
                          ),
                          AppText(
                            user.email,
                            translation: false,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Role Card
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            LocaleKeys.auth_role,
                            translation: true,
                            style: theme.textTheme.bodyMedium,
                          ),
                          Chip(
                            label: AppText(
                              user.type,
                              translation: false,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: theme.colorScheme.primaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  // Logout Button
                  BlocBuilder<ProfileBloc, ProfileState>(
                    bloc: _profileBloc,
                    builder: (context, state) {
                      final isLoggingOut = state.status.isLoading();

                      return CustomFilledButton(
                        text: LocaleKeys.profile_logout,
                        onPressed: isLoggingOut ? null : _onLogout,
                        backgroundColor: theme.colorScheme.error,
                        textColor: theme.colorScheme.onError,
                        height: 50.h,
                        icon: Icons.logout,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
