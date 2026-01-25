import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/status/ui_helper.dart';
import '../../domain/entities/stock_item_entity.dart';
import 'stock_item_card.dart';

//* Stock list widget
class HomeStockList extends StatelessWidget {
  final List<StockItemEntity> stockItems;
  final VoidCallback? onItemTap;

  const HomeStockList({
    super.key,
    required this.stockItems,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    if (stockItems.isEmpty) {
      return Center(
        child: NoDataWidget(message: 'home.noStockItems'.tr()),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: stockItems.length,
      itemBuilder: (context, index) {
        final stockItem = stockItems[index];
        return StockItemCard(
          stockItem: stockItem,
          onTap: onItemTap,
        );
      },
    );
  }
}
