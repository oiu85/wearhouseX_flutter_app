import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../../stock/domain/entities/product_entity.dart';

/// Product dropdown field with pending/cart status indicators
class ProductDropdownField extends StatelessWidget {
  final List<ProductEntity> products;
  final int? selectedProductId;
  final Set<int> pendingProductIds;
  final Set<int> cartProductIds;
  final ValueChanged<int?> onProductSelected;
  final ColorScheme colorScheme;

  const ProductDropdownField({
    super.key,
    required this.products,
    required this.selectedProductId,
    required this.pendingProductIds,
    required this.cartProductIds,
    required this.onProductSelected,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField<int>(
        value: selectedProductId,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: LocaleKeys.stockRequest_selectProduct.tr(),
          prefixIcon: Icon(Icons.inventory_rounded, color: colorScheme.primary),
          filled: true,
          fillColor: colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
          ),
        ),
        items: products.map((product) {
          final hasPending = pendingProductIds.contains(product.id);
          final isInCart = cartProductIds.contains(product.id);
          final isDisabled = hasPending || isInCart;

          return DropdownMenuItem<int>(
            value: product.id,
            enabled: !isDisabled,
            child: Opacity(
              opacity: isDisabled ? 0.5 : 1.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        decoration: isDisabled ? TextDecoration.lineThrough : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  if (hasPending)
                    _buildPendingBadge(theme)
                  else if (isInCart)
                    _buildInCartBadge(theme)
                  else
                    _buildStockBadge(product.warehouseQuantity, theme),
                ],
              ),
            ),
          );
        }).toList(),
        onChanged: onProductSelected,
      ),
    );
  }

  Widget _buildPendingBadge(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.orange, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.pending_outlined,
            size: 12.sp,
            color: Colors.orange,
          ),
          SizedBox(width: 4.w),
          Text(
            LocaleKeys.payments_pending.tr(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 9.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInCartBadge(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        'In Cart',
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 9.sp,
        ),
      ),
    );
  }

  Widget _buildStockBadge(int quantity, ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: quantity > 0
            ? colorScheme.primaryContainer
            : colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        '$quantity',
        style: theme.textTheme.labelSmall?.copyWith(
          color: quantity > 0
              ? colorScheme.onPrimaryContainer
              : colorScheme.onErrorContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
