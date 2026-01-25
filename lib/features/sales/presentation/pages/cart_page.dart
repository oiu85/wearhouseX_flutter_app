import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/order_summary_widget.dart';
import '../widgets/checkout_summary_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

/// Cart page displaying cart items and checkout functionality
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CreateSaleBloc _createSaleBloc = GetIt.I<CreateSaleBloc>();

  Future<void> _onRefresh() async {
    _createSaleBloc.add(const LoadCartFromStorage());
    try {
      await _createSaleBloc.stream
          .skip(1)
          .firstWhere(
            (state) => state.status.isSuccess() || state.status.isFail(),
          )
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      // Timeout or error - refresh will complete anyway
    }
  }

  void _onCheckout() {
    final state = _createSaleBloc.state;
    if (state.cartItems.isEmpty) {
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CheckoutSummaryDialog(
        cartItems: state.cartItems,
        totalAmount: state.totalAmount,
        totalItems: state.totalItems,
        onSubmit: (customerName) {
          final items = state.cartItems.map((cartItem) {
            return SaleItemEntity(
              productId: cartItem.productId,
              productName: cartItem.productName,
              quantity: cartItem.quantity,
              price: cartItem.price,
              subtotal: cartItem.subtotal,
            );
          }).toList();

          _createSaleBloc.add(
            CreateSaleSubmitted(
              customerName: customerName,
              items: items,
            ),
          );
        },
      ),
    );
  }

  void _onViewStock() {
    context.push(AppRoutes.stock);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<CreateSaleBloc, CreateSaleState>(
      bloc: _createSaleBloc,
      listenWhen: (previous, current) {
        // Only listen when sale transitions to success with a created sale
        return current.status.isSuccess() &&
            current.createdSale != null &&
            (previous.createdSale?.id != current.createdSale?.id);
      },
      listener: (context, state) {
        if (state.createdSale != null) {
          // Close checkout dialog if open (use maybePop to avoid errors)
          Navigator.of(context).maybePop();
          // Navigate to sale detail page after a short delay to ensure dialog is closed
          Future.delayed(const Duration(milliseconds: 150), () {
            if (mounted && context.mounted) {
              context.push(
                AppRoutes.saleDetail.replaceAll(':id', state.createdSale!.id.toString()),
              );
            }
          });
        }
      },
      child: BlocBuilder<CreateSaleBloc, CreateSaleState>(
        bloc: _createSaleBloc,
        builder: (context, state) {
          return AppScaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              title: AppText(
                LocaleKeys.sales_cart,
                translation: true,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: BlocBuilder<CreateSaleBloc, CreateSaleState>(
              bloc: _createSaleBloc,
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
                  loadingMore: () => RefreshIndicator(
                    onRefresh: _onRefresh,
                    color: theme.colorScheme.primary,
                    child: _buildContent(context, theme, state),
                  ),
                  success: () => RefreshIndicator(
                    onRefresh: _onRefresh,
                    color: theme.colorScheme.primary,
                    child: _buildContent(context, theme, state),
                  ),
                  fail: (error) => UiHelperStatus(
                    state: state.status,
                    message: state.errorMessage,
                    onRetry: () {
                      _createSaleBloc.add(const LoadCartFromStorage());
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, CreateSaleState state) {
    if (state.cartItems.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.3),
                  ),
                  SizedBox(height: 24.h),
                  AppText(
                    LocaleKeys.sales_emptyCart,
                    translation: true,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomFilledButton(
                    text: LocaleKeys.sales_selectProducts.tr(),
                    onPressed: _onViewStock,
                    backgroundColor: theme.colorScheme.primary,
                    textColor: theme.colorScheme.onPrimary,
                    height: 50.h,
                    borderRadius: 16.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
            child: AppText(
              LocaleKeys.sales_cart,
              translation: true,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
                fontSize: 24.sp,
                height: 1.3,
                letterSpacing: -0.5,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = state.cartItems[index];
                return CartItemCard(
                  item: item,
                  onQuantityChanged: (quantity) {
                    _createSaleBloc.add(
                      UpdateCartItemQuantity(
                        productId: item.productId,
                        quantity: quantity,
                      ),
                    );
                  },
                  onRemove: () {
                    _createSaleBloc.add(
                      RemoveProductFromCart(item.productId),
                    );
                  },
                );
              },
              childCount: state.cartItems.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                CustomFilledButton(
                  text: LocaleKeys.sales_addMoreProducts,
                  onPressed: _onViewStock,
                  backgroundColor: theme.colorScheme.secondary,
                  textColor: theme.colorScheme.onSecondary,
                  height: 50.h,
                  borderRadius: 16.r,
                ),
                SizedBox(height: 16.h),
                OrderSummaryWidget(state: state),
                SizedBox(height: 16.h),
                CustomFilledButton(
                  text: LocaleKeys.sales_checkout,
                  onPressed: _onCheckout,
                  backgroundColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.onPrimary,
                  height: 56.h,
                  borderRadius: 16.r,
                  icon: Icons.shopping_bag_rounded,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
