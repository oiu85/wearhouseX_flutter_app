import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';
import 'cart_multi_select_header.dart';
import 'cart_multi_select_content.dart';

/// Always-visible multi-select dropdown for adding products to cart
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectDropdown extends StatelessWidget {
  const CartMultiSelectDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final createSaleBloc = GetIt.I<CreateSaleBloc>();

    return BlocBuilder<CreateSaleBloc, CreateSaleState>(
      bloc: createSaleBloc,
      builder: (context, saleState) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: theme.colorScheme.primary.withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header with expand/collapse
              CartMultiSelectHeader(
                saleState: saleState,
                onToggleExpanded: () {
                  createSaleBloc.add(const ToggleMultiSelectExpanded());
                },
              ),
              // Expanded content
              if (saleState.isMultiSelectExpanded) ...[
                Divider(
                  height: 1,
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
                CartMultiSelectContent(
                  saleState: saleState,
                  createSaleBloc: createSaleBloc,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
