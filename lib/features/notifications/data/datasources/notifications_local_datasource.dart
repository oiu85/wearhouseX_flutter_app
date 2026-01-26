import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../domain/entities/notification_entity.dart';

/// Local data source for notifications (stored in SharedPreferences)
class NotificationsLocalDataSource {
  static const String _notificationsKey = 'notifications';
  static const String _unreadCountKey = 'unread_count';

  final SharedPreferences _prefs;

  NotificationsLocalDataSource(this._prefs);

  /// Get all notifications from local storage
  List<NotificationEntity> getNotifications() {
    final jsonString = _prefs.getString(_notificationsKey);
    if (jsonString == null) return [];

    try {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => NotificationEntity(
                id: json['id'] as String,
                title: json['title'] as String,
                body: json['body'] as String,
                data: json['data'] as Map<String, dynamic>? ?? {},
                receivedAt: DateTime.parse(json['received_at'] as String),
                isRead: json['is_read'] as bool? ?? false,
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Save notification to local storage
  Future<void> saveNotification(NotificationEntity notification) async {
    final notifications = getNotifications();
    notifications.insert(0, notification); // Add to beginning

    // Keep only last 100 notifications
    if (notifications.length > 100) {
      notifications.removeRange(100, notifications.length);
    }

    final jsonList = notifications.map((n) => {
          'id': n.id,
          'title': n.title,
          'body': n.body,
          'data': n.data,
          'received_at': n.receivedAt.toIso8601String(),
          'is_read': n.isRead,
        }).toList();

    await _prefs.setString(_notificationsKey, json.encode(jsonList));
    await _updateUnreadCount();
  }

  /// Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    final notifications = getNotifications();
    final index = notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(isRead: true);
      final jsonList = notifications.map((n) => {
            'id': n.id,
            'title': n.title,
            'body': n.body,
            'data': n.data,
            'received_at': n.receivedAt.toIso8601String(),
            'is_read': n.isRead,
          }).toList();
      await _prefs.setString(_notificationsKey, json.encode(jsonList));
      await _updateUnreadCount();
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    final notifications = getNotifications();
    final updatedNotifications = notifications
        .map((n) => n.copyWith(isRead: true))
        .toList();

    final jsonList = updatedNotifications.map((n) => {
          'id': n.id,
          'title': n.title,
          'body': n.body,
          'data': n.data,
          'received_at': n.receivedAt.toIso8601String(),
          'is_read': n.isRead,
        }).toList();

    await _prefs.setString(_notificationsKey, json.encode(jsonList));
    await _updateUnreadCount();
  }

  /// Get unread count
  int getUnreadCount() {
    return getNotifications().where((n) => !n.isRead).length;
  }

  /// Update unread count in storage
  Future<void> _updateUnreadCount() async {
    final count = getUnreadCount();
    await _prefs.setInt(_unreadCountKey, count);
  }

  /// Clear all notifications
  Future<void> clearAll() async {
    await _prefs.remove(_notificationsKey);
    await _prefs.remove(_unreadCountKey);
  }
}
