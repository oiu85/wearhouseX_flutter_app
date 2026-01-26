// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      receivedAt: json['received_at'] as String,
      isRead: json['is_read'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
      'received_at': instance.receivedAt,
      'is_read': instance.isRead,
    };
