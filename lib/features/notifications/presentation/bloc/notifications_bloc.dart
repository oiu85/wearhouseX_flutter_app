import 'package:flutter_app_wearhouse/features/notifications/domain/entities/notification_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../domain/repositories/notifications_repository.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

/// Notifications BLoC
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository _repository;

  NotificationsBloc({
    required NotificationsRepository repository,
  })  : _repository = repository,
        super(NotificationsState.initial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkNotificationAsRead>(_onMarkNotificationAsRead);
    on<MarkAllNotificationsAsRead>(_onMarkAllNotificationsAsRead);
    on<RefreshNotifications>(_onRefreshNotifications);
    on<AddNotification>(_onAddNotification);
    on<ClearSnackbarMessage>(_onClearSnackbarMessage);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await _repository.getNotifications();

    // Check if result is Left (failure) or Right (success)
    final failure = result.fold(
      (l) => l,
      (r) => null,
    );

    if (failure != null) {
      // Handle failure case
      if (!emit.isDone) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      }
      return;
    }

    // Extract notifications from Right side
    final notifications = result.fold(
      (l) => <NotificationEntity>[],
      (r) => r,
    );

    // Await unread count before emitting
    final unreadResult = await _repository.getUnreadCount();
    final unreadCount = unreadResult.fold(
      (failure) => 0,
      (count) => count,
    );

    // Check if emit is still valid before emitting
    if (!emit.isDone) {
      emit(state.copyWith(
        status: const BlocStatus.success(),
        notifications: notifications,
        unreadCount: unreadCount,
        errorMessage: null,
      ));
    }
  }

  Future<void> _onMarkNotificationAsRead(
    MarkNotificationAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await _repository.markAsRead(event.notificationId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          snackbarMessage: failure.message,
          showSuccessSnackbar: false,
        ));
      },
      (_) async {
        // Reload notifications to update state
        add(const LoadNotifications());
      },
    );
  }

  Future<void> _onMarkAllNotificationsAsRead(
    MarkAllNotificationsAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await _repository.markAllAsRead();

    result.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          snackbarMessage: failure.message,
          showSuccessSnackbar: false,
        ));
      },
      (_) async {
        emit(state.copyWith(
          snackbarMessage: LocaleKeys.notifications_markAllAsRead,
          showSuccessSnackbar: true,
        ));
        // Reload notifications to update state
        add(const LoadNotifications());
      },
    );
  }

  Future<void> _onRefreshNotifications(
    RefreshNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    add(const LoadNotifications());
  }

  Future<void> _onAddNotification(
    AddNotification event,
    Emitter<NotificationsState> emit,
  ) async {
    // Notification is already saved by FCM service
    // Just reload the list
    add(const LoadNotifications());
  }

  void _onClearSnackbarMessage(
    ClearSnackbarMessage event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(
      snackbarMessage: null,
      showSuccessSnackbar: false,
    ));
  }
}
