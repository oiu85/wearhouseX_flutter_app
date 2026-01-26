import 'package:flutter/material.dart';
import 'package:flutter_app_wearhouse/core/localization/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../sales/presentation/bloc/sales_bloc.dart';
import '../../../sales/presentation/bloc/sales_event.dart';
import '../../../sales/presentation/bloc/sales_state.dart';
import '../bloc/stock_detail_bloc.dart';
import '../bloc/stock_detail_event.dart';
import '../bloc/stock_detail_state.dart';
import '../widgets/stock_detail_image.dart';
import '../widgets/stock_detail_info_section.dart';
import '../widgets/stock_detail_quantity_section.dart';
import '../widgets/stock_detail_price_section.dart';
import '../widgets/stock_detail_quantity_selector.dart';
import 'package:easy_localization/easy_localization.dart';

//* Stock detail page displaying comprehensive product information
class StockDetailPage extends StatefulWidget {
  final int? stockItemId;
  final int? productId;

  const StockDetailPage({
    super.key,
    this.stockItemId,
    this.productId,
  }) : assert(stockItemId != null || productId != null, 'Either stockItemId or productId must be provided');

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  final StockDetailBloc _stockDetailBloc = GetIt.I<StockDetailBloc>();
  final CreateSaleBloc _createSaleBloc = GetIt.I<CreateSaleBloc>();
  int _selectedQuantity = 1;

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      _stockDetailBloc.add(LoadStockDetailByProductId(widget.productId!));
    } else if (widget.stockItemId != null) {
      _stockDetailBloc.add(LoadStockDetail(widget.stockItemId!));
    }
  }

  @override
  void dispose() {
    _stockDetailBloc.add(const ResetStockDetail());
    super.dispose();
  }

  void _onQuantityChanged(int quantity) {
    setState(() {
      _selectedQuantity = quantity;
    });
  }

  void _onAddToCart(StockDetailState state) {
    if (state.stockItem == null) return;

    final stockItem = state.stockItem!;
    
    if (_selectedQuantity > stockItem.quantity) {
      AppSnackbar.showError(
        context,
        LocaleKeys.stockDetail_availableQuantity.tr(),
        translation: false,
      );
      return;
    }

    _createSaleBloc.add(
      AddProductToCart(
        productId: stockItem.productId,
        productName: stockItem.product.name,
        price: stockItem.product.price,
        availableQuantity: stockItem.quantity,
      ),
    );

    // Add selected quantity times
    for (int i = 1; i < _selectedQuantity; i++) {
      _createSaleBloc.add(
        UpdateCartItemQuantity(
          productId: stockItem.productId,
          quantity: i + 1,
        ),
      );
    }

    AppSnackbar.showSuccess(
      context,
      '${stockItem.product.name} ${LocaleKeys.sales_addedToCart.tr()}',
      translation: false,
    );

    // Reset quantity to 1
    setState(() {
      _selectedQuantity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<StockDetailBloc, StockDetailState>(
      bloc: _stockDetailBloc,
      builder: (context, state) {
        return AppScaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: AppText(
              LocaleKeys.stockDetail_title,
              translation: true,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: BlocBuilder<StockDetailBloc, StockDetailState>(
            bloc: _stockDetailBloc,
            builder: (context, state) {
              return state.status.when(
                init: () => UiHelperStatus(
                  state: state.status,
                  message: null,
                ),
                loading: () => UiHelperStatus(
                  state: state.status,
                  message: null,
                ),
                loadingMore: () => _buildContent(context, theme, state),
                success: () => _buildContent(context, theme, state),
                fail: (error) => UiHelperStatus(
                  state: state.status,
                  message: state.errorMessage,
                  onRetry: () {
                    if (widget.productId != null) {
                      _stockDetailBloc.add(LoadStockDetailByProductId(widget.productId!));
                    } else if (widget.stockItemId != null) {
                      _stockDetailBloc.add(LoadStockDetail(widget.stockItemId!));
                    }
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, StockDetailState state) {
    if (state.stockItem == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Product Image
                StockDetailImage(
                  imageUrl: state.stockItem!.product.image,
                ),

                //* Product Info Section
                StockDetailInfoSection(
                  stockItem: state.stockItem!,
                ),

                //* Available Quantity Section
                StockDetailQuantitySection(
                  stockItem: state.stockItem!,
                ),

                //* Price Section
                StockDetailPriceSection(
                  stockItem: state.stockItem!,
                ),

                //* Quantity Selector
                if (state.stockItem!.quantity > 0)
                  StockDetailQuantitySelector(
                    quantity: _selectedQuantity,
                    maxQuantity: state.stockItem!.quantity,
                    onQuantityChanged: _onQuantityChanged,
                  ),

                SizedBox(height: 100.h), //* Space for bottom button
              ],
            ),
          ),
        ),

        //* Add to Cart Button (Fixed at bottom)
        if (state.stockItem!.quantity > 0)
          BlocBuilder<CreateSaleBloc, CreateSaleState>(
            bloc: _createSaleBloc,
            builder: (context, cartState) {
              final cartItemCount = cartState.cartItems.length;
              return Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      if (cartItemCount > 0)
                        Container(
                          margin: EdgeInsets.only(right: 12.w),
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Icons.shopping_cart_rounded,
                                color: theme.colorScheme.secondary,
                                size: 24.sp,
                              ),
                              if (cartItemCount > 0)
                                Positioned(
                                  right: -4,
                                  top: -4,
                                  child: Container(
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.error,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: BoxConstraints(
                                      minWidth: 16.w,
                                      minHeight: 16.h,
                                    ),
                                    child: Center(
                                      child: AppText(
                                        cartItemCount > 99 ? '99+' : '$cartItemCount',
                                        translation: false,
                                        style: theme.textTheme.labelSmall?.copyWith(
                                          color: theme.colorScheme.onError,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: CustomFilledButton(
                          text: LocaleKeys.sales_addToCart.tr(),
                          onPressed: () => _onAddToCart(state),
                          width: double.infinity,
                          backgroundColor: theme.colorScheme.primary,
                          textColor: theme.colorScheme.onPrimary,
                          icon: Icons.add_shopping_cart_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        else
          Container(
            padding: EdgeInsets.all(16.w),
            child: SafeArea(
              child: CustomFilledButton(
                text: 'Request Stock',
                onPressed: () {
                  if (state.stockItem?.productId != null) {
                    context.push(
                      '${AppRoutes.stockRequest}?productId=${state.stockItem!.productId}&productName=${Uri.encodeComponent(state.stockItem!.product.name)}',
                    );
                  } else {
                    context.push(AppRoutes.stockRequest);
                  }
                },
                width: double.infinity,
                backgroundColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
                icon: Icons.inventory_2_rounded,
              ),
            ),
          ),
      ],
    );
  }
}
