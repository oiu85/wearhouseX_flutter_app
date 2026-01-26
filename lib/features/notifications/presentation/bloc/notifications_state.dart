import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/notification_entity.dart';

/// Notifications state
class NotificationsState extends Equatable {
  final BlocStatus status;
  final List<NotificationEntity> notifications;
  final int unreadCount;
  final String? errorMessage;
  final String? snackbarMessage;
  final bool showSuccessSnackbar;

  const NotificationsState({
    required this.status,
    required this.notifications,
    required this.unreadCount,
    this.errorMessage,
    this.snackbarMessage,
    this.showSuccessSnackbar = false,
  });

  factory NotificationsState.initial() {
    return const NotificationsState(
      status: BlocStatus.initial(),
      notifications: [],
      unreadCount: 0,
    );
  }

  NotificationsState copyWith({
    BlocStatus? status,
    List<NotificationEntity>? notifications,
    int? unreadCount,
    String? errorMessage,
    String? snackbarMessage,
    bool? showSuccessSnackbar,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
      errorMessage: errorMessage ?? this.errorMessage,
      snackbarMessage: snackbarMessage,
      showSuccessSnackbar: showSuccessSnackbar ?? this.showSuccessSnackbar,
    );
  }

  @override
  List<Object?> get props => [
        status,
        notifications,
        unreadCount,
        errorMessage,
        snackbarMessage,
        showSuccessSnackbar,
      ];
}
