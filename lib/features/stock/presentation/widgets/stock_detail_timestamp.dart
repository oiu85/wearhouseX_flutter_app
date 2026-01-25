import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/utils/time_utils.dart';
import '../../domain/entities/stock_item_entity.dart';

//* Last updated timestamp widget
class StockDetailTimestamp extends StatelessWidget {
  final StockItemEntity stockItem;

  const StockDetailTimestamp({
    super.key,
    required this.stockItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (stockItem.updatedAt == null) {
      return const SizedBox.shrink();
    }

    final relativeTime = TimeUtils.formatRelativeTime(stockItem.updatedAt!);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            size: 16.sp,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          SizedBox(width: 8.w),
          AppText(
            'stockDetail.lastUpdated',
            translation: true,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          SizedBox(width: 4.w),
          AppText(
            relativeTime,
            translation: false,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
