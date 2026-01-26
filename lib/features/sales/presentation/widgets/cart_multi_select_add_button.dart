import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';
import '../../../stock/presentation/bloc/stock_bloc.dart';
import '../../../stock/presentation/bloc/stock_state.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';

/// Add selected products button widget
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectAddButton extends StatelessWidget {
  final CreateSaleState saleState;
  final StockState stockState;
  final CreateSaleBloc createSaleBloc;

  const CartMultiSelectAddButton({
    super.key,
    required this.saleState,
    required this.stockState,
    required this.createSaleBloc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (saleState.selectedProductIds.isEmpty) {
      return const SizedBox.shrink();
    }

    return CustomFilledButton(
      text: LocaleKeys.sales_addSelected,
      onPressed: () {
        // Get selected items from stock state
        final selectedItems = stockState.filteredStockItems
            .where((item) => saleState.selectedProductIds.contains(item.productId))
            .map((item) => AddProductToCartData(
                  productId: item.productId,
                  productName: item.product.name,
                  price: item.product.price,
                  availableQuantity: item.quantity,
                ))
            .toList();

        if (selectedItems.isNotEmpty) {
          createSaleBloc.add(
            AddMultipleProductsToCart(products: selectedItems),
          );
        }
      },
      backgroundColor: theme.colorScheme.primary,
      textColor: theme.colorScheme.onPrimary,
      height: 48.h,
      borderRadius: 12.r,
      icon: Icons.add_shopping_cart_rounded,
    );
  }
}
