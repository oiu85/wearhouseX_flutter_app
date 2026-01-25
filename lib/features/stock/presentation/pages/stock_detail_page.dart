import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/status/ui_helper.dart';
import '../bloc/stock_detail_bloc.dart';
import '../bloc/stock_detail_event.dart';
import '../bloc/stock_detail_state.dart';
import '../widgets/stock_detail_image.dart';
import '../widgets/stock_detail_info_section.dart';
import '../widgets/stock_detail_quantity_section.dart';
import '../widgets/stock_detail_price_section.dart';
import '../widgets/stock_detail_timestamp.dart';

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

  void _onSellProduct() {
    //* Navigate to sales creation page
    //* For now, just show a placeholder - sales page will be implemented separately
    final state = _stockDetailBloc.state;
    if (state.stockItem != null) {
      //* Navigate to sales page with product pre-selected
      context.push(
        '/sales/create',
        extra: {
          'productId': state.stockItem!.productId,
          'stockItemId': state.stockItem!.id,
          'availableQuantity': state.stockItem!.quantity,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: AppText(
          'stockDetail.title',
          translation: true,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<StockDetailBloc, StockDetailState>(
        bloc: _stockDetailBloc,
        builder: (context, state) {
          //* Show loading state
          if (state.status.isLoading() || state.status.isInitial()) {
            return Center(
              child: CircularProgressIndicator(color: theme.colorScheme.primary),
            );
          }

          //* Show error state
          if (state.status.isFail()) {
            return Center(
              child: UiHelperStatus(
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
          }

          //* Show success state with product details
          if (state.stockItem != null) {
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

                        //* Last Updated Timestamp
                        StockDetailTimestamp(
                          stockItem: state.stockItem!,
                        ),

                        SizedBox(height: 100.h), //* Space for bottom button
                      ],
                    ),
                  ),
                ),

                //* Sell Product Button (Fixed at bottom)
                Container(
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
                    child: CustomFilledButton(
                      text: 'stockDetail.sellProduct'.tr(),
                      onPressed: state.stockItem!.quantity > 0
                          ? _onSellProduct
                          : null,
                      width: double.infinity,
                      backgroundColor: state.stockItem!.quantity > 0
                          ? theme.colorScheme.primary
                          : theme.colorScheme.surfaceContainerHighest,
                      textColor: state.stockItem!.quantity > 0
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface.withOpacity(0.5),
                      icon: Icons.shopping_cart,
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
