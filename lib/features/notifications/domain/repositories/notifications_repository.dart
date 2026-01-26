import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/notification_entity.dart';


/// Abstract repository for notifications
abstract class NotificationsRepository {
  /// Get all notifications
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();

  /// Mark notification as read
  Future<Either<Failure, void>> markAsRead(String notificationId);

  /// Mark all notifications as read
  Future<Either<Failure, void>> markAllAsRead();

  /// Get unread count
  Future<Either<Failure, int>> getUnreadCount();
}
