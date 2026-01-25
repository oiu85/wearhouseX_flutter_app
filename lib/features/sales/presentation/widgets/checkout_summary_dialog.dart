import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_state.dart';
import 'package:easy_localization/easy_localization.dart';

/// Checkout summary dialog with customer name input and order details
class CheckoutSummaryDialog extends StatefulWidget {
  final List<CartItem> cartItems;
  final double totalAmount;
  final int totalItems;
  final ValueChanged<String> onSubmit;

  const CheckoutSummaryDialog({
    super.key,
    required this.cartItems,
    required this.totalAmount,
    required this.totalItems,
    required this.onSubmit,
  });

  @override
  State<CheckoutSummaryDialog> createState() => _CheckoutSummaryDialogState();
}

class _CheckoutSummaryDialogState extends State<CheckoutSummaryDialog> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final CreateSaleBloc _createSaleBloc = GetIt.I<CreateSaleBloc>();

  @override
  void dispose() {
    _customerNameController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(_customerNameController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.viewInsets.bottom;

    return BlocListener<CreateSaleBloc, CreateSaleState>(
      bloc: _createSaleBloc,
      listener: (context, state) {
        // Only handle errors here - success is handled by CartPage
        if (state.status.isFail()) {
          AppSnackbar.showError(
            context,
            state.errorMessage ?? LocaleKeys.status_somethingWentWrong,
            translation: state.errorMessage == null,
          );
        }
      },
      child: Container(
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
            //* Drag handle
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, bottomPadding + 16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //* Title
                      AppText(
                        LocaleKeys.checkout_title,
                        translation: true,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                          fontSize: 22.sp,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      //* Customer Name Field
                      CustomTextField(
                        controller: _customerNameController,
                        labelText: LocaleKeys.checkout_customerName.tr(),
                        hintText: LocaleKeys.sales_enterCustomerName.tr(),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return LocaleKeys.sales_customerNameRequired.tr();
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),

                      //* Order Items List
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              LocaleKeys.sales_cart,
                              translation: true,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            ...widget.cartItems.map((item) => Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: AppText(
                                          item.productName,
                                          translation: false,
                                          style: theme.textTheme.bodyMedium?.copyWith(
                                            color: theme.colorScheme.onSurface,
                                            fontSize: 14.sp,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      AppText(
                                        '${item.quantity} × \$${item.price.toStringAsFixed(2)}',
                                        translation: false,
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      AppText(
                                        '\$${item.subtotal.toStringAsFixed(2)}',
                                        translation: false,
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      //* Order Summary
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.2),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  LocaleKeys.sales_totalItems,
                                  translation: true,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                AppText(
                                  '${widget.totalItems}',
                                  translation: false,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Divider(
                              color: theme.colorScheme.onSurface.withOpacity(0.2),
                              height: 1,
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  LocaleKeys.sales_totalAmount,
                                  translation: true,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                AppText(
                                  '\$${widget.totalAmount.toStringAsFixed(2)}',
                                  translation: false,
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),

                      //* Submit Button
                      BlocBuilder<CreateSaleBloc, CreateSaleState>(
                        bloc: _createSaleBloc,
                        builder: (context, state) {
                          final isLoading = state.status.isLoading();

                          return CustomFilledButton(
                            text: LocaleKeys.checkout_submitSale.tr(),
                            onPressed: isLoading ? null : _onSubmit,
                            backgroundColor: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                            height: 56.h,
                            borderRadius: 16.r,
                            icon: Icons.check_circle_rounded,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
