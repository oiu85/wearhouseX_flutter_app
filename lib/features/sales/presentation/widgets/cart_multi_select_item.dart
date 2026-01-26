import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';

/// Individual stock item widget for multi-select dropdown
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectItem extends StatelessWidget {
  final StockItemEntity item;
  final bool isSelected;
  final CreateSaleBloc createSaleBloc;

  const CartMultiSelectItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.createSaleBloc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAvailable = item.quantity > 0;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.primaryContainer.withOpacity(0.3)
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: isSelected
            ? Border.all(
                color: theme.colorScheme.primary,
                width: 2,
              )
            : Border.all(
                color: theme.colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isAvailable
              ? () => createSaleBloc.add(
                    ToggleProductSelection(item.productId),
                  )
              : null,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: isAvailable
                      ? (value) => createSaleBloc.add(
                            ToggleProductSelection(item.productId),
                          )
                      : null,
                  activeColor: theme.colorScheme.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        item.product.name,
                        translation: false,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isAvailable
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.onSurface.withOpacity(0.5),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          AppText(
                            '\$${item.product.price.toStringAsFixed(2)}',
                            translation: false,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          AppText(
                            'Qty: ${item.quantity}',
                            translation: false,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isAvailable
                                  ? theme.colorScheme.onSurface.withOpacity(0.7)
                                  : theme.colorScheme.error,
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
}
