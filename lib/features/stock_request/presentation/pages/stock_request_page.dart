import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/di/app_dependencies.dart';
import '../../../stock/presentation/bloc/stock_bloc.dart';
import '../../../stock/presentation/bloc/stock_event.dart';
import '../bloc/stock_request_bloc.dart';
import '../bloc/stock_request_event.dart';
import '../bloc/stock_request_state.dart';
import '../widgets/add_product_form_section.dart';
import '../widgets/cart_header.dart';
import '../widgets/cart_empty_state.dart';
import '../widgets/stock_request_cart_item.dart';
import '../widgets/failed_items_banner.dart';
import '../widgets/submit_cart_button.dart';

/// Modern stock request page with multi-product cart support
class StockRequestPage extends StatefulWidget {
  final int? productId;
  final String? productName;
  final int? initialQuantity;

  const StockRequestPage({
    super.key,
    this.productId,
    this.productName,
    this.initialQuantity,
  });

  @override
  State<StockRequestPage> createState() => _StockRequestPageState();
}

class _StockRequestPageState extends State<StockRequestPage> with SingleTickerProviderStateMixin {
  late final StockRequestBloc _stockRequestBloc;
  late final StockBloc _stockBloc;
  late final TextEditingController _quantityController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _stockRequestBloc = getIt<StockRequestBloc>();
    _stockBloc = getIt<StockBloc>();
    _quantityController = TextEditingController();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    
    _animationController.forward();
    
    // Load pending requests first to know which products can't be requested
    _stockRequestBloc.add(const LoadStockRequests());
    
    // Load products if no product is pre-selected
    if (widget.productId == null) {
      _stockBloc.add(const LoadAllProducts());
    } else {
      _stockRequestBloc.add(
        InitializeStockRequestForm(
          productId: widget.productId,
          productName: widget.productName,
          initialQuantity: widget.initialQuantity,
        ),
      );
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocProvider.value(
      value: _stockRequestBloc,
      child: BlocListener<StockRequestBloc, StockRequestState>(
        listener: (context, state) => _handleStateChanges(context, state),
        child: AppScaffold(
          appBar: _buildAppBar(theme, colorScheme),
          body: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      // Add product form section
                      SliverPadding(
                        padding: EdgeInsets.all(16.w),
                        sliver: SliverToBoxAdapter(
                          child: AddProductFormSection(
                            quantityController: _quantityController,
                            stockBloc: _stockBloc,
                          ),
                        ),
                      ),

                      // Cart header
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        sliver: SliverToBoxAdapter(
                          child: BlocBuilder<StockRequestBloc, StockRequestState>(
                            builder: (context, state) {
                              return CartHeader(
                                itemCount: state.cartItemCount,
                                totalQuantity: state.totalCartQuantity,
                                onClearAll: state.cart.isNotEmpty
                                    ? () {
                                        context.read<StockRequestBloc>().add(const ClearCart());
                                      }
                                    : null,
                              );
                            },
                          ),
                        ),
                      ),

                      // Failed items warning banner
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        sliver: SliverToBoxAdapter(
                          child: BlocBuilder<StockRequestBloc, StockRequestState>(
                            builder: (context, state) {
                              return FailedItemsBanner(
                                successfulSubmissions: state.successfulSubmissions,
                                totalSubmissions: state.totalSubmissions,
                              );
                            },
                          ),
                        ),
                      ),

                      // Cart items list
                      BlocBuilder<StockRequestBloc, StockRequestState>(
                        builder: (context, state) {
                          if (state.cart.isEmpty) {
                            return const SliverToBoxAdapter(
                              child: CartEmptyState(),
                            );
                          }

                          return SliverPadding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final item = state.cart[index];
                                  return StockRequestCartItemWidget(
                                    item: item,
                                    onRemove: () {
                                      context.read<StockRequestBloc>().add(
                                            RemoveProductFromCart(item.productId),
                                          );
                                    },
                                  );
                                },
                                childCount: state.cart.length,
                              ),
                            ),
                          );
                        },
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 100.h)),
                    ],
                  ),
                ),

                // Submit button
                BlocBuilder<StockRequestBloc, StockRequestState>(
                  builder: (context, state) {
                    return SubmitCartButton(
                      isLoading: state.status.isLoading(),
                      canSubmit: state.cart.isNotEmpty && !state.status.isLoading(),
                      cartItemCount: state.cartItemCount,
                      successfulSubmissions: state.successfulSubmissions,
                      totalSubmissions: state.totalSubmissions,
                      onSubmit: () {
                        context.read<StockRequestBloc>().add(
                              const SubmitMultiProductRequest(),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(ThemeData theme, ColorScheme colorScheme) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      title: AppText(
        LocaleKeys.stockRequest_title,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, StockRequestState state) {
    if (state.snackbarMessage != null) {
      String message = state.snackbarMessage!;

      // Handle messages with parameter substitution
      if (message == 'stockRequest.requestsSubmittedWithErrors') {
        final success = state.successfulSubmissions;
        final failed = state.totalSubmissions - success;
        message = '$success ${LocaleKeys.stockRequest_requestSubmitted.tr()}, $failed ${LocaleKeys.stockRequest_requestFailed.tr()}';
      } else if (message == 'stockRequest.partialSuccess') {
        message = '${state.successfulSubmissions} ${LocaleKeys.app_success.tr()} ${state.totalSubmissions}';
      } else if (message.startsWith('stockRequest.')) {
        message = message.tr();
      }

      if (state.showSuccessSnackbar) {
        AppSnackbar.showSuccess(context, message);
      } else {
        AppSnackbar.showError(context, message);
      }
      context.read<StockRequestBloc>().add(const ClearSnackbarMessage());
    }

    if (state.shouldPop) {
      context.pop(true);
    }
  }
}
