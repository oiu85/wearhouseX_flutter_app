import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';
import '../../../stock/presentation/bloc/stock_bloc.dart';
import '../../../stock/presentation/bloc/stock_state.dart';
import '../bloc/sales_bloc.dart';
import 'cart_multi_select_item.dart';

/// Stock list widget for multi-select dropdown
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectList extends StatelessWidget {
  final List<StockItemEntity> stockItems;
  final Set<int> selectedProductIds;
  final CreateSaleBloc createSaleBloc;

  const CartMultiSelectList({
    super.key,
    required this.stockItems,
    required this.selectedProductIds,
    required this.createSaleBloc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (stockItems.isEmpty) {
      return SizedBox(
        height: 100.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 48.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.3),
              ),
              SizedBox(height: 8.h),
              AppText(
                LocaleKeys.home_noStockItems,
                translation: true,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300.h),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        itemCount: stockItems.length,
        itemBuilder: (context, index) {
          final item = stockItems[index];
          final isSelected = selectedProductIds.contains(item.productId);

          return CartMultiSelectItem(
            item: item,
            isSelected: isSelected,
            createSaleBloc: createSaleBloc,
          );
        },
      ),
    );
  }
}
