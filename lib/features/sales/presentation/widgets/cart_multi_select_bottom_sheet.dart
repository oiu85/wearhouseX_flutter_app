import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';
import '../../../stock/presentation/bloc/stock_bloc.dart';
import '../../../stock/presentation/bloc/stock_event.dart';
import '../../../stock/presentation/bloc/stock_state.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';

/// Multi-select bottom sheet for adding products to cart
class CartMultiSelectBottomSheet extends StatefulWidget {
  const CartMultiSelectBottomSheet({super.key});

  @override
  State<CartMultiSelectBottomSheet> createState() =>
      _CartMultiSelectBottomSheetState();
}

class _CartMultiSelectBottomSheetState
    extends State<CartMultiSelectBottomSheet> {
  final StockBloc _stockBloc = GetIt.I<StockBloc>();
  final CreateSaleBloc _createSaleBloc = GetIt.I<CreateSaleBloc>();
  final TextEditingController _searchController = TextEditingController();
  final Set<int> _selectedProductIds = <int>{};

  @override
  void initState() {
    super.initState();
    _stockBloc.add(const LoadStock());
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _stockBloc.add(SearchStock(_searchController.text));
  }

  void _toggleSelection(int productId) {
    setState(() {
      if (_selectedProductIds.contains(productId)) {
        _selectedProductIds.remove(productId);
      } else {
        _selectedProductIds.add(productId);
      }
    });
  }

  void _addSelectedToCart() {
    if (_selectedProductIds.isEmpty) return;

    final stockState = _stockBloc.state;
    final selectedItems = stockState.filteredStockItems
        .where((item) => _selectedProductIds.contains(item.productId))
        .toList();

    for (final item in selectedItems) {
      if (item.quantity > 0) {
        _createSaleBloc.add(
          AddProductToCart(
            productId: item.productId,
            productName: item.product.name,
            price: item.product.price,
            availableQuantity: item.quantity,
          ),
        );
      }
    }

    Navigator.of(context).pop();
  }

  Widget _buildStockList(
    BuildContext context,
    ThemeData theme,
    List<StockItemEntity> stockItems,
  ) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: stockItems.length,
      itemBuilder: (context, index) {
        final item = stockItems[index];
        final isSelected = _selectedProductIds.contains(item.productId);
        final isAvailable = item.quantity > 0;

        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.colorScheme.primaryContainer.withOpacity(0.3)
                : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: isSelected
                ? Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  )
                : Border.all(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                    width: 1,
                  ),
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
            child: InkWell(
              onTap: isAvailable ? () => _toggleSelection(item.productId) : null,
              borderRadius: BorderRadius.circular(16.r),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  children: [
                    Checkbox(
                      value: isSelected,
                      onChanged: isAvailable
                          ? (value) => _toggleSelection(item.productId)
                          : null,
                      activeColor: theme.colorScheme.primary,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            item.product.name,
                            translation: false,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isAvailable
                                  ? theme.colorScheme.onSurface
                                  : theme.colorScheme.onSurface.withOpacity(0.5),
                            ),
                            maxLines: 2,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.viewInsets.bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: mediaQuery.size.height * 0.9,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    LocaleKeys.sales_selectProducts,
                    translation: true,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                if (_selectedProductIds.isNotEmpty)
                  AppText(
                    '${_selectedProductIds.length} ${LocaleKeys.sales_selected}',
                    translation: true,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextField(
              controller: _searchController,
              hintText: LocaleKeys.sales_searchProducts.tr(),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Flexible(
            child: BlocBuilder<StockBloc, StockState>(
              bloc: _stockBloc,
              builder: (context, state) {
                return state.status.when(
                  init: () => Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  loadingMore: () {
                    final stockItems = state.filteredStockItems;
                    if (stockItems.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 64.sp,
                              color: theme.colorScheme.onSurface.withOpacity(0.3),
                            ),
                            SizedBox(height: 16.h),
                            AppText(
                              LocaleKeys.home_noStockItems,
                              translation: true,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return _buildStockList(context, theme, stockItems);
                  },
                  success: () {
                    final stockItems = state.filteredStockItems;
                    if (stockItems.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 64.sp,
                              color: theme.colorScheme.onSurface.withOpacity(0.3),
                            ),
                            SizedBox(height: 16.h),
                            AppText(
                              LocaleKeys.home_noStockItems,
                              translation: true,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return _buildStockList(context, theme, stockItems);
                  },
                  fail: (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: 64.sp,
                          color: theme.colorScheme.error,
                        ),
                        SizedBox(height: 16.h),
                        AppText(
                          state.errorMessage ?? LocaleKeys.status_somethingWentWrong,
                          translation: state.errorMessage == null,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, bottomPadding + 16.h),
            child: CustomFilledButton(
              text: LocaleKeys.sales_addSelected,
              onPressed: _selectedProductIds.isEmpty ? null : _addSelectedToCart,
              backgroundColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
              height: 56.h,
              borderRadius: 16.r,
              icon: Icons.add_shopping_cart_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
