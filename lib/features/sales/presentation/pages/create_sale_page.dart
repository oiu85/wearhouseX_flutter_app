import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
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

/// Create sale page
class CreateSalePage extends StatefulWidget {
  final int? preSelectedProductId;
  final int? preSelectedStockItemId;
  final int? preSelectedAvailableQuantity;

  const CreateSalePage({
    super.key,
    this.preSelectedProductId,
    this.preSelectedStockItemId,
    this.preSelectedAvailableQuantity,
  });

  @override
  State<CreateSalePage> createState() => _CreateSalePageState();
}

class _CreateSalePageState extends State<CreateSalePage> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final CreateSaleBloc _createSaleBloc = GetIt.I<CreateSaleBloc>();

  @override
  void dispose() {
    _customerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<CreateSaleBloc, CreateSaleState>(
      bloc: _createSaleBloc,
      listener: (context, state) {
        if (state.status.isSuccess() && state.createdSale != null) {
          // Navigate to sale confirmation page
          context.push(
            '${AppRoutes.saleDetail}/${state.createdSale!.id}',
          );
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: AppText(
            'sales.createSale',
            translation: true,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<CreateSaleBloc, CreateSaleState>(
          bloc: _createSaleBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Customer Name Field
                    CustomTextField(
                      controller: _customerNameController,
                      labelText: LocaleKeys.sales_customerName.tr(),
                      hintText: 'sales.enterCustomerName',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'sales.customerNameRequired'.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    // Cart Items Section
                    if (state.cartItems.isEmpty)
                      Container(
                        padding: EdgeInsets.all(32.w),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 64.sp,
                              color: theme.colorScheme.onSurface.withOpacity(0.3),
                            ),
                            SizedBox(height: 16.h),
                            AppText(
                              'sales.noItemsInCart',
                              translation: true,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomFilledButton(
                              text: 'sales.selectProducts',
                              onPressed: () {
                                // Navigate to stock page to select products
                                context.push(AppRoutes.stock);
                              },
                              backgroundColor: theme.colorScheme.primary,
                              textColor: theme.colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'sales.cart',
                            translation: true,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ...state.cartItems.map((item) => CartItemCard(
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
                              )),
                          SizedBox(height: 16.h),
                          CustomFilledButton(
                            text: 'sales.addMoreProducts',
                            onPressed: () {
                              context.push(AppRoutes.stock);
                            },
                            backgroundColor: theme.colorScheme.secondary,
                            textColor: theme.colorScheme.onSecondary,
                          ),
                        ],
                      ),
                    SizedBox(height: 24.h),
                    // Order Summary
                    if (state.cartItems.isNotEmpty) OrderSummaryWidget(state: state),
                    SizedBox(height: 24.h),
                    // Complete Sale Button
                    if (state.cartItems.isNotEmpty)
                      BlocBuilder<CreateSaleBloc, CreateSaleState>(
                        bloc: _createSaleBloc,
                        builder: (context, state) {
                          final isLoading = state.status.isLoading();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomFilledButton(
                                text: 'sales.completeSale',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState?.validate() ?? false) {
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
                                              customerName: _customerNameController.text,
                                              items: items,
                                            ),
                                          );
                                        }
                                      },
                                backgroundColor: theme.colorScheme.primary,
                                textColor: theme.colorScheme.onPrimary,
                                height: 50.h,
                              ),
                              SizedBox(height: 16.h),
                              UiHelperStatus(
                                state: state.status,
                                message: state.errorMessage,
                                onRetry: () {
                                  if (_formKey.currentState?.validate() ?? false) {
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
                                        customerName: _customerNameController.text,
                                        items: items,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
