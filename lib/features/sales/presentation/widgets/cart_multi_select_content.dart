import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_state.dart';
import 'cart_multi_select_search_field.dart';
import 'cart_multi_select_list.dart';
import 'cart_multi_select_add_button.dart';

/// Content widget for multi-select dropdown (search, list, button)
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectContent extends StatelessWidget {
  final CreateSaleState saleState;
  final CreateSaleBloc createSaleBloc;

  const CartMultiSelectContent({
    super.key,
    required this.saleState,
    required this.createSaleBloc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          const CartMultiSelectSearchField(),
          SizedBox(height: 16.h),
          // Use sales bloc's own products, not stock bloc
          saleState.productsStatus.when(
            init: () => SizedBox(
              height: 100.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            loading: () => SizedBox(
              height: 100.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            loadingMore: () => CartMultiSelectList(
              stockItems: saleState.filteredProducts,
              selectedProductIds: saleState.selectedProductIds,
              createSaleBloc: createSaleBloc,
            ),
            success: () => CartMultiSelectList(
              stockItems: saleState.filteredProducts,
              selectedProductIds: saleState.selectedProductIds,
              createSaleBloc: createSaleBloc,
            ),
            fail: (error) => SizedBox(
              height: 100.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 48.sp,
                      color: theme.colorScheme.error,
                    ),
                    SizedBox(height: 8.h),
                    AppText(
                      error ?? LocaleKeys.status_somethingWentWrong,
                      translation: error == null,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (saleState.selectedProductIds.isNotEmpty) ...[
            SizedBox(height: 16.h),
            CartMultiSelectAddButton(
              saleState: saleState,
              createSaleBloc: createSaleBloc,
            ),
          ],
        ],
      ),
    );
  }
}
