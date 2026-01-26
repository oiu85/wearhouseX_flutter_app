import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/notification_entity.dart';

part 'notification_models.freezed.dart';
part 'notification_models.g.dart';

/// Notification model
@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'data') @Default({}) Map<String, dynamic> data,
    @JsonKey(name: 'received_at') required String receivedAt,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

/// Extension to convert NotificationModel to NotificationEntity
extension NotificationModelExtension on NotificationModel {
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      title: title,
      body: body,
      data: data,
      receivedAt: DateTime.parse(receivedAt),
      isRead: isRead,
    );
  }
}
