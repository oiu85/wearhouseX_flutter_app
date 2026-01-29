import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/sales_state.dart';

/// Cart item card widget with modern design
class CartItemCard extends StatefulWidget {
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
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late TextEditingController _quantityController;
  late TextEditingController _customPriceController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: widget.item.quantity.toString());
    _customPriceController = TextEditingController(
      text: widget.item.customPrice?.toStringAsFixed(2) ?? '',
    );
  }

  @override
  void didUpdateWidget(CartItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update controllers when item changes
    if (oldWidget.item.quantity != widget.item.quantity) {
      _quantityController.text = widget.item.quantity.toString();
    }
    if (oldWidget.item.customPrice != widget.item.customPrice) {
      _customPriceController.text = widget.item.customPrice?.toStringAsFixed(2) ?? '';
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _customPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = widget.item;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with product name and remove button
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 12.w, 12.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    item.productName,
                    translation: false,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                      fontSize: 16.sp,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: widget.onRemove,
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
          ),
          
          // Body with pricing and quantity controls
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pricing Row
                Row(
                  children: [
                    // Original Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          LocaleKeys.sales_unitPrice,
                          translation: true,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                            fontSize: 11.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        AppText(
                          '\$${item.price.toStringAsFixed(2)}',
                          translation: false,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: item.customPrice != null
                                ? theme.colorScheme.onSurface.withOpacity(0.5)
                                : theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            decoration: item.customPrice != null
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ],
                    ),
                    if (item.customPrice != null) ...[
                      SizedBox(width: 16.w),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: theme.colorScheme.primary,
                        size: 20.sp,
                      ),
                      SizedBox(width: 16.w),
                      // Custom Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppText(
                                LocaleKeys.sales_customPrice,
                                translation: true,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                  fontSize: 11.sp,
                                ),
                              ),
                              if (item.pricePercentage != null) ...[
                                SizedBox(width: 4.w),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.tertiaryContainer,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: AppText(
                                    '${item.pricePercentage! > 0 ? "+" : ""}${item.pricePercentage!.toStringAsFixed(1)}%',
                                    translation: false,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onTertiaryContainer,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          SizedBox(height: 4.h),
                          AppText(
                            '\$${item.customPrice!.toStringAsFixed(2)}',
                            translation: false,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const Spacer(),
                    // Subtotal
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          LocaleKeys.sales_subtotal,
                          translation: true,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                            fontSize: 11.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        AppText(
                          '\$${item.subtotal.toStringAsFixed(2)}',
                          translation: false,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 16.h),
                
                // Quantity Controls
                Row(
                  children: [
                    AppText(
                      LocaleKeys.sales_quantity,
                      translation: true,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Decrease button
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: item.quantity > 1
                                  ? () => widget.onQuantityChanged(item.quantity - 1)
                                  : null,
                              borderRadius: BorderRadius.circular(8.r),
                              child: Container(
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
                          SizedBox(width: 8.w),
                          // Quantity input
                          SizedBox(
                            width: 65.w,
                            child: TextFormField(
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.outline.withOpacity(0.3),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.outline.withOpacity(0.3),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.primary,
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: theme.colorScheme.surface,
                              ),
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                                fontSize: 16.sp,
                              ),
                              onChanged: (value) {
                                final quantity = int.tryParse(value);
                                if (quantity != null && quantity > 0 && quantity <= item.availableQuantity) {
                                  widget.onQuantityChanged(quantity);
                                }
                              },
                              onTapOutside: (_) {
                                // Revert to current quantity if input is invalid
                                if (_quantityController.text.isEmpty ||
                                    int.tryParse(_quantityController.text) == null) {
                                  _quantityController.text = item.quantity.toString();
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 8.w),
                          // Increase button
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: item.quantity < item.availableQuantity
                                  ? () => widget.onQuantityChanged(item.quantity + 1)
                                  : null,
                              borderRadius: BorderRadius.circular(8.r),
                              child: Container(
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
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Available stock indicator
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 14.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                    SizedBox(width: 4.w),
                    AppText(
                      '${item.availableQuantity} ${LocaleKeys.sales_available.tr()}',
                      translation: false,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                
                // Custom Price Input (if enabled)
                if (widget.onCustomPriceChanged != null) ...[
                  SizedBox(height: 16.h),
                  Divider(height: 1, color: theme.colorScheme.outline.withOpacity(0.2)),
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: _customPriceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: LocaleKeys.sales_customPrice.tr(),
                      hintText: LocaleKeys.sales_enterCustomPrice.tr(),
                      prefixIcon: Icon(Icons.attach_money_rounded, size: 20.sp),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      filled: true,
                      fillColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                    ),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                    onChanged: (value) {
                      final price = double.tryParse(value);
                      widget.onCustomPriceChanged?.call(price);
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

