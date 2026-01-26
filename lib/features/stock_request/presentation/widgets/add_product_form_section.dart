import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../../stock/presentation/bloc/stock_bloc.dart';
import '../../../stock/presentation/bloc/stock_state.dart';
import '../../../stock/domain/entities/product_entity.dart';
import '../bloc/stock_request_bloc.dart';
import '../bloc/stock_request_event.dart';
import '../bloc/stock_request_state.dart';
import 'pending_orders_info_banner.dart';
import 'product_dropdown_field.dart';
import 'warehouse_stock_info.dart';

/// Add product form section for stock requests
class AddProductFormSection extends StatelessWidget {
  final TextEditingController quantityController;
  final StockBloc stockBloc;

  const AddProductFormSection({
    super.key,
    required this.quantityController,
    required this.stockBloc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer.withOpacity(0.3),
            colorScheme.secondaryContainer.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      LocaleKeys.stockRequest_addProduct,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    AppText(
                      LocaleKeys.stockRequest_addProductsToRequest,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Pending orders banner
          BlocBuilder<StockRequestBloc, StockRequestState>(
            builder: (context, requestState) {
              return PendingOrdersInfoBanner(
                pendingCount: requestState.pendingProductIds.length,
              );
            },
          ),

          // Product dropdown
          BlocBuilder<StockBloc, StockState>(
            bloc: stockBloc,
            builder: (context, stockState) {
              if (stockState.productsStatus.isLoading()) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colorScheme.primary,
                  ),
                );
              }

              if (stockState.allProducts.isEmpty) {
                return _buildNoProductsAvailable(context, theme, colorScheme);
              }

              return BlocBuilder<StockRequestBloc, StockRequestState>(
                builder: (context, requestState) {
                  final cartProductIds = requestState.cart.map((item) => item.productId).toSet();

                  return ProductDropdownField(
                    products: stockState.allProducts,
                    selectedProductId: requestState.selectedProductId,
                    pendingProductIds: requestState.pendingProductIds,
                    cartProductIds: cartProductIds,
                    colorScheme: colorScheme,
                    onProductSelected: (productId) => _handleProductSelection(
                      context,
                      productId,
                      stockState.allProducts,
                      requestState,
                      colorScheme,
                    ),
                  );
                },
              );
            },
          ),

          SizedBox(height: 16.h),

          // Warehouse stock info
          BlocBuilder<StockRequestBloc, StockRequestState>(
            builder: (context, state) {
              return WarehouseStockInfo(
                warehouseStock: state.selectedProductWarehouseStock,
              );
            },
          ),

          SizedBox(height: 16.h),

          // Quantity field
          _buildQuantityField(context, theme, colorScheme),

          SizedBox(height: 20.h),

          // Add to cart button
          _buildAddToCartButton(context, theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildNoProductsAvailable(BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: colorScheme.error,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: AppText(
              LocaleKeys.stockRequest_noProductsAvailable,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityField(BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return BlocBuilder<StockRequestBloc, StockRequestState>(
      builder: (context, state) {
        if (quantityController.text != state.quantity) {
          quantityController.text = state.quantity;
        }

        return TextFormField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: LocaleKeys.stockRequest_quantity.tr(),
            hintText: LocaleKeys.stockRequest_enterQuantity.tr(),
            prefixIcon: Icon(Icons.production_quantity_limits_rounded, color: colorScheme.primary),
            filled: true,
            fillColor: colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 2),
            ),
            errorText: state.quantityError != null ? state.quantityError!.tr() : null,
            helperText: state.selectedProductWarehouseStock != null
                ? '${LocaleKeys.stockRequest_maxAvailable.tr()}: ${state.selectedProductWarehouseStock}'
                : null,
            helperStyle: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          onChanged: (value) {
            context.read<StockRequestBloc>().add(SetQuantity(value));
          },
        );
      },
    );
  }

  Widget _buildAddToCartButton(BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return BlocBuilder<StockRequestBloc, StockRequestState>(
      builder: (context, state) {
        final canAdd = state.selectedProductId != null &&
            state.quantity.isNotEmpty &&
            int.tryParse(state.quantity) != null &&
            int.parse(state.quantity) > 0 &&
            (state.selectedProductWarehouseStock == null ||
                int.parse(state.quantity) <= state.selectedProductWarehouseStock!);

        return BlocBuilder<StockBloc, StockState>(
          bloc: stockBloc,
          builder: (context, stockState) {
            return ElevatedButton.icon(
              onPressed: canAdd
                  ? () {
                      final selectedProduct = stockState.allProducts.firstWhere(
                        (p) => p.id == state.selectedProductId,
                      );
                      context.read<StockRequestBloc>().add(
                            AddProductToCart(
                              productId: state.selectedProductId!,
                              productName: selectedProduct.name,
                              quantity: int.parse(state.quantity),
                              warehouseStock: state.selectedProductWarehouseStock ?? 0,
                            ),
                          );
                      quantityController.clear();
                    }
                  : null,
              icon: Icon(Icons.add_rounded, size: 20.sp),
              label: AppText(
                LocaleKeys.stockRequest_addProduct,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: canAdd ? 4 : 0,
              ),
            );
          },
        );
      },
    );
  }

  void _handleProductSelection(
    BuildContext context,
    int? productId,
    List<ProductEntity> products,
    StockRequestState requestState,
    ColorScheme colorScheme,
  ) {
    if (productId == null) return;

    // Check for pending order
    if (requestState.hasPendingOrder(productId)) {
      context.read<StockRequestBloc>().add(
        const SelectProduct(0, warehouseStock: 0),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppText(
            LocaleKeys.stockRequest_pendingOrderExists,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: colorScheme.error,
        ),
      );
      return;
    }

    final selectedProduct = products.firstWhere(
      (product) => product.id == productId,
    );
    context.read<StockRequestBloc>().add(
          SelectProduct(
            productId,
            warehouseStock: selectedProduct.warehouseQuantity,
          ),
        );
  }
}
