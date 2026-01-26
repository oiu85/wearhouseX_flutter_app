import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/di/app_dependencies.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_event.dart';
import '../bloc/notifications_state.dart';
import '../widgets/notification_item.dart';

/// Notifications page with modern, beautiful design
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> with SingleTickerProviderStateMixin {
  late final NotificationsBloc _notificationsBloc;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _notificationsBloc = getIt<NotificationsBloc>();
    _notificationsBloc.add(const LoadNotifications());
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocProvider.value(
      value: _notificationsBloc,
      child: BlocListener<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
          if (state.snackbarMessage != null) {
            if (state.showSuccessSnackbar) {
              AppSnackbar.showSuccess(
                context,
                state.snackbarMessage!,
              );
            } else {
              AppSnackbar.showError(
                context,
                state.snackbarMessage!,
              );
            }
            context.read<NotificationsBloc>().add(const ClearSnackbarMessage());
          }
        },
        child: AppScaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            title: AppText(
              LocaleKeys.notifications_title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            actions: [
              BlocBuilder<NotificationsBloc, NotificationsState>(
                builder: (context, state) {
                  if (state.unreadCount > 0) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: TextButton.icon(
                        onPressed: () {
                          context.read<NotificationsBloc>().add(
                                const MarkAllNotificationsAsRead(),
                              );
                        },
                        icon: Icon(
                          Icons.done_all_rounded,
                          size: 18.sp,
                          color: colorScheme.primary,
                        ),
                        label: AppText(
                          LocaleKeys.notifications_markAllAsRead,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: colorScheme.primary.withOpacity(0.1),
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          body: BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              if (state.status.isLoading()) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: colorScheme.primary,
                        strokeWidth: 3,
                      ),
                      SizedBox(height: 16.h),
                      AppText(
                        LocaleKeys.app_loading,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state.status.isFail()) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.error_outline_rounded,
                            size: 64.sp,
                            color: colorScheme.error,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        AppText(
                          state.errorMessage ?? LocaleKeys.app_somethingWentWrong,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<NotificationsBloc>().add(
                                  const LoadNotifications(),
                                );
                          },
                          icon: Icon(Icons.refresh_rounded, size: 20.sp),
                          label: AppText(LocaleKeys.app_retry),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state.notifications.isEmpty) {
                return Center(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(32.w),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none_rounded,
                            size: 80.sp,
                            color: colorScheme.primary.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        AppText(
                          LocaleKeys.notifications_noNotifications,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        AppText(
                          'You\'re all caught up!',
                          translation: false,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NotificationsBloc>().add(
                        const RefreshNotifications(),
                      );
                },
                color: colorScheme.primary,
                backgroundColor: colorScheme.surface,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(
                        top: 8.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: BlocBuilder<NotificationsBloc, NotificationsState>(
                          builder: (context, state) {
                            if (state.unreadCount > 0) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 16.h),
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      colorScheme.primaryContainer.withOpacity(0.5),
                                      colorScheme.primaryContainer.withOpacity(0.2),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: colorScheme.primary.withOpacity(0.3),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline_rounded,
                                      color: colorScheme.primary,
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: AppText(
                                        'You have ${state.unreadCount} unread notification${state.unreadCount > 1 ? 's' : ''}',
                                        translation: false,
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onPrimaryContainer,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final notification = state.notifications[index];
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: NotificationItem(
                                notification: notification,
                                onTap: () {
                                  context.read<NotificationsBloc>().add(
                                        MarkNotificationAsRead(notification.id),
                                      );
                                },
                              ),
                            );
                          },
                          childCount: state.notifications.length,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
