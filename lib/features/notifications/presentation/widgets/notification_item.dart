import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/notification_entity.dart';

/// Modern notification item widget with beautiful design
class NotificationItem extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback? onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final timeAgo = _formatTimeAgo(notification.receivedAt);
    final notificationType = notification.data['type'] as String?;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: notification.isRead 
            ? colorScheme.surface 
            : colorScheme.primaryContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: notification.isRead
              ? colorScheme.outlineVariant.withOpacity(0.5)
              : colorScheme.primary.withOpacity(0.3),
          width: notification.isRead ? 1 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: notification.isRead 
                ? colorScheme.shadow.withOpacity(0.05)
                : colorScheme.primary.withOpacity(0.1),
            blurRadius: notification.isRead ? 4 : 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _getGradientColors(notificationType, colorScheme, notification.isRead),
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: _getIconColor(notificationType, colorScheme).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    _getIconForType(notificationType),
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: notification.isRead 
                                    ? FontWeight.w600 
                                    : FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          if (!notification.isRead)
                            Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.primary.withOpacity(0.5),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        notification.body,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.8),
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14.sp,
                            color: colorScheme.onSurface.withOpacity(0.5),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            timeAgo,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.5),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: _getTypeColor(notificationType, colorScheme).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              _getTypeLabel(notificationType),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: _getTypeColor(notificationType, colorScheme),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors(String? type, ColorScheme colorScheme, bool isRead) {
    final baseColor = _getIconColor(type, colorScheme);
    if (isRead) {
      return [
        baseColor.withOpacity(0.5),
        baseColor.withOpacity(0.3),
      ];
    }
    return [
      baseColor,
      baseColor.withOpacity(0.7),
    ];
  }

  Color _getIconColor(String? type, ColorScheme colorScheme) {
    switch (type) {
      case 'sale_created':
        return Colors.green;
      case 'stock_order_approved':
        return Colors.blue;
      case 'stock_order_rejected':
        return Colors.red;
      case 'stock_order_status_changed':
        return Colors.orange;
      default:
        return colorScheme.primary;
    }
  }

  Color _getTypeColor(String? type, ColorScheme colorScheme) {
    return _getIconColor(type, colorScheme);
  }

  String _getTypeLabel(String? type) {
    switch (type) {
      case 'sale_created':
        return 'SALE';
      case 'stock_order_approved':
        return 'APPROVED';
      case 'stock_order_rejected':
        return 'REJECTED';
      case 'stock_order_status_changed':
        return 'STATUS';
      default:
        return 'INFO';
    }
  }

  IconData _getIconForType(String? type) {
    switch (type) {
      case 'sale_created':
        return Icons.shopping_cart_rounded;
      case 'stock_order_approved':
        return Icons.check_circle_rounded;
      case 'stock_order_rejected':
        return Icons.cancel_rounded;
      case 'stock_order_status_changed':
        return Icons.inventory_rounded;
      default:
        return Icons.notifications_rounded;
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return DateFormat('MMM d, y').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
