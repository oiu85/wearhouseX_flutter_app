import 'package:equatable/equatable.dart';

/// Notifications events
abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

/// Load notifications
class LoadNotifications extends NotificationsEvent {
  const LoadNotifications();
}

/// Mark notification as read
class MarkNotificationAsRead extends NotificationsEvent {
  final String notificationId;

  const MarkNotificationAsRead(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

/// Mark all notifications as read
class MarkAllNotificationsAsRead extends NotificationsEvent {
  const MarkAllNotificationsAsRead();
}

/// Refresh notifications
class RefreshNotifications extends NotificationsEvent {
  const RefreshNotifications();
}

/// Add new notification (from FCM)
class AddNotification extends NotificationsEvent {
  final String id;
  final String title;
  final String body;
  final Map<String, dynamic> data;

  const AddNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.data,
  });

  @override
  List<Object?> get props => [id, title, body, data];
}

/// Clear snackbar message
class ClearSnackbarMessage extends NotificationsEvent {
  const ClearSnackbarMessage();
}
