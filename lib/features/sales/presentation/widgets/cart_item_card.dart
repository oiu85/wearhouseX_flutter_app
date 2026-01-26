import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../bloc/sales_state.dart';

/// Cart item card widget with modern design
class CartItemCard extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<double?>? onCustomPriceChanged;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    this.onCustomPriceChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      item.productName,
                      translation: false,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        fontSize: 15.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 4.h,
                      children: [
                        AppText(
                          '\$${item.price.toStringAsFixed(2)}',
                          translation: false,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                        if (item.customPrice != null) ...[
                          AppText(
                            '→ \$${item.customPrice!.toStringAsFixed(2)}',
                            translation: false,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                        if (item.pricePercentage != null) ...[
                          AppText(
                            '(${item.pricePercentage!.toStringAsFixed(1)}%)',
                            translation: false,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.tertiary,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                        AppText(
                          '× ${item.quantity}',
                          translation: false,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                            fontSize: 13.sp,
                          ),
                        ),
                        AppText(
                          '= \$${item.subtotal.toStringAsFixed(2)}',
                          translation: false,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    if (onCustomPriceChanged != null) ...[
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: item.customPrice?.toStringAsFixed(2) ?? '',
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(
                                labelText: 'Custom Price',
                                hintText: 'Enter custom price',
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onChanged: (value) {
                                final price = double.tryParse(value);
                                onCustomPriceChanged?.call(price);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Quantity Controls
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: item.quantity > 1
                          ? theme.colorScheme.primary.withOpacity(0.15)
                          : theme.colorScheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: item.quantity > 1
                            ? () => onQuantityChanged(item.quantity - 1)
                            : null,
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Icon(
                            Icons.remove_rounded,
                            color: item.quantity > 1
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface.withOpacity(0.3),
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  SizedBox(
                    width: 60.w,
                    child: TextFormField(
                      initialValue: item.quantity.toString(),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.primaryContainer.withOpacity(0.3),
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                        fontSize: 16.sp,
                      ),
                      onChanged: (value) {
                        final quantity = int.tryParse(value);
                        if (quantity != null && quantity > 0 && quantity <= item.availableQuantity) {
                          onQuantityChanged(quantity);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    decoration: BoxDecoration(
                      color: item.quantity < item.availableQuantity
                          ? theme.colorScheme.primary.withOpacity(0.15)
                          : theme.colorScheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: item.quantity < item.availableQuantity
                            ? () => onQuantityChanged(item.quantity + 1)
                            : null,
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Icon(
                            Icons.add_rounded,
                            color: item.quantity < item.availableQuantity
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface.withOpacity(0.3),
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onRemove,
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: theme.colorScheme.error,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
