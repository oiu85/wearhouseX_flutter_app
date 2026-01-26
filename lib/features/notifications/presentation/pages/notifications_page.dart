import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/di/app_dependencies.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_event.dart';
import '../bloc/notifications_state.dart';
import '../widgets/notification_item.dart';

/// Notifications page
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late final NotificationsBloc _notificationsBloc;

  @override
  void initState() {
    super.initState();
    _notificationsBloc = getIt<NotificationsBloc>();
    _notificationsBloc.add(const LoadNotifications());
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
            title: AppText(
              LocaleKeys.notifications_title,
              style: theme.textTheme.titleLarge,
            ),
            actions: [
              BlocBuilder<NotificationsBloc, NotificationsState>(
                builder: (context, state) {
                  if (state.unreadCount > 0) {
                    return TextButton(
                      onPressed: () {
                        context.read<NotificationsBloc>().add(
                              const MarkAllNotificationsAsRead(),
                            );
                      },
                      child: AppText(
                        LocaleKeys.notifications_markAllAsRead,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colorScheme.primary,
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
                  child: CircularProgressIndicator(
                    color: colorScheme.primary,
                  ),
                );
              }

              if (state.status.isFail()) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      AppText(
                        state.errorMessage ?? LocaleKeys.app_somethingWentWrong,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<NotificationsBloc>().add(
                                const LoadNotifications(),
                              );
                        },
                        child: AppText(LocaleKeys.app_retry),
                      ),
                    ],
                  ),
                );
              }

              if (state.notifications.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_none,
                        size: 64,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      AppText(
                        LocaleKeys.notifications_noNotifications,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
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
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return NotificationItem(
                      notification: notification,
                      onTap: () {
                        context.read<NotificationsBloc>().add(
                              MarkNotificationAsRead(notification.id),
                            );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
