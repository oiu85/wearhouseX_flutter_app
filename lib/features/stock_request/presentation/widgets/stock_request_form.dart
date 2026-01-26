import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../stock/presentation/bloc/stock_bloc.dart';
import '../../../stock/presentation/bloc/stock_event.dart';
import '../../../stock/presentation/bloc/stock_state.dart';
import '../bloc/stock_request_bloc.dart';
import '../bloc/stock_request_event.dart';
import '../bloc/stock_request_state.dart';
import '../../../../core/di/app_dependencies.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';

/// Stock request form widget
class StockRequestForm extends StatefulWidget {
  final int? productId;
  final String? productName;
  final int? initialQuantity;

  const StockRequestForm({
    super.key,
    this.productId,
    this.productName,
    this.initialQuantity,
  });

  @override
  State<StockRequestForm> createState() => _StockRequestFormState();
}

class _StockRequestFormState extends State<StockRequestForm> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final StockBloc _stockBloc = getIt<StockBloc>();

  @override
  void initState() {
    super.initState();
    
    // Initialize form in BLoC
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StockRequestBloc>().add(
            InitializeStockRequestForm(
              productId: widget.productId,
              productName: widget.productName,
              initialQuantity: widget.initialQuantity,
            ),
          );
      
      if (widget.initialQuantity != null) {
        _quantityController.text = widget.initialQuantity.toString();
      }
      
      // Load all products from admin inventory if no product is pre-selected
      if (widget.productId == null) {
        _stockBloc.add(const LoadAllProducts());
      }
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BlocBuilder<StockRequestBloc, StockRequestState>(
      builder: (context, requestState) {
        return BlocBuilder<StockBloc, StockState>(
          bloc: _stockBloc,
          builder: (context, stockState) {
            // Sync quantity controller with state
            if (_quantityController.text != requestState.quantity) {
              _quantityController.text = requestState.quantity;
            }
            
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Show product card if pre-selected, otherwise show dropdown
                  if (widget.productName != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              LocaleKeys.stockRequest_product,
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            AppText(
                              widget.productName!,
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    stockState.productsStatus.isLoading()
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : stockState.allProducts.isEmpty
                            ? Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: AppText(
                                    LocaleKeys.stockRequest_noProductsAvailable,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : DropdownButtonFormField<int>(
                                value: requestState.selectedProductId,
                                decoration: InputDecoration(
                                  labelText: LocaleKeys.stockRequest_selectProduct.tr(),
                                  hintText: LocaleKeys.stockRequest_chooseProduct.tr(),
                                  border: const OutlineInputBorder(),
                                  errorText: requestState.productError != null
                                      ? requestState.productError!.tr()
                                      : null,
                                ),
                                items: stockState.allProducts.map((product) {
                                  return DropdownMenuItem<int>(
                                    value: product.id,
                                    child: AppText(
                                      product.name,
                                      translation: false,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (productId) {
                                  if (productId != null) {
                                    // Find the selected product to get warehouse stock
                                    final selectedProduct = stockState.allProducts.firstWhere(
                                      (product) => product.id == productId,
                                      orElse: () => stockState.allProducts.first,
                                    );
                                    
                                    context.read<StockRequestBloc>().add(
                                          SelectProduct(
                                            productId,
                                            warehouseStock: selectedProduct.warehouseQuantity,
                                          ),
                                        );
                                  }
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return LocaleKeys.stockRequest_productRequired.tr();
                                  }
                                  return null;
                                },
                              ),
                  const SizedBox(height: 16),
                  // Show warehouse stock info if product is selected
                  if (requestState.selectedProductId != null &&
                      requestState.selectedProductWarehouseStock != null)
                    Card(
                      color: theme.colorScheme.surfaceVariant,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              color: theme.colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: AppText(
                                '${LocaleKeys.stockRequest_warehouseStock.tr()}: ${requestState.selectedProductWarehouseStock} ${LocaleKeys.stockRequest_units.tr()}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: requestState.selectedProductWarehouseStock! > 0
                                      ? theme.colorScheme.onSurfaceVariant
                                      : theme.colorScheme.error,
                                  fontWeight: FontWeight.w500,
                                ),
                                translation: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (requestState.selectedProductId != null &&
                      requestState.selectedProductWarehouseStock != null)
                    const SizedBox(height: 8),
                  TextFormField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.stockRequest_quantity.tr(),
                      hintText: LocaleKeys.stockRequest_enterQuantity.tr(),
                      border: const OutlineInputBorder(),
                      errorText: requestState.quantityError != null
                          ? requestState.quantityError!.tr()
                          : null,
                      helperText: requestState.selectedProductWarehouseStock != null
                          ? '${LocaleKeys.stockRequest_maxAvailable.tr()}: ${requestState.selectedProductWarehouseStock}'
                          : null,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<StockRequestBloc>().add(SetQuantity(value));
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.stockRequest_quantityRequired.tr();
                      }
                      final quantity = int.tryParse(value);
                      if (quantity == null || quantity <= 0) {
                        return LocaleKeys.stockRequest_quantityInvalid.tr();
                      }
                      // Validate against warehouse stock
                      final warehouseStock = requestState.selectedProductWarehouseStock ?? 0;
                      if (quantity > warehouseStock) {
                        return LocaleKeys.stockRequest_quantityExceedsStock.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: requestState.status.isLoading()
                        ? null
                        : () {
                            context.read<StockRequestBloc>().add(
                                  const SubmitStockRequest(),
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: requestState.status.isLoading()
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : AppText(
                            LocaleKeys.stockRequest_submitRequest,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
