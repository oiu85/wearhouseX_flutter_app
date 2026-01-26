/// Notification entity representing a push notification
class NotificationEntity {
  final String id;
  final String title;
  final String body;
  final Map<String, dynamic> data;
  final DateTime receivedAt;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.data,
    required this.receivedAt,
    this.isRead = false,
  });

  NotificationEntity copyWith({
    String? id,
    String? title,
    String? body,
    Map<String, dynamic>? data,
    DateTime? receivedAt,
    bool? isRead,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      data: data ?? this.data,
      receivedAt: receivedAt ?? this.receivedAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
