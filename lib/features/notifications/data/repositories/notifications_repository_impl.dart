import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_local_datasource.dart';


@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsLocalDataSource _localDataSource;

  NotificationsRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      final notifications = _localDataSource.getNotifications();
      return Right(notifications);
    } catch (e) {
      return Left(NetworkFailure('Failed to get notifications: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String notificationId) async {
    try {
      await _localDataSource.markAsRead(notificationId);
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure('Failed to mark notification as read: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead() async {
    try {
      await _localDataSource.markAllAsRead();
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure('Failed to mark all notifications as read: $e'));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    try {
      final count = _localDataSource.getUnreadCount();
      return Right(count);
    } catch (e) {
      return Left(NetworkFailure('Failed to get unread count: $e'));
    }
  }
}
