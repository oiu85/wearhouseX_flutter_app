import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/stock_request_entity.dart';
import '../../domain/entities/stock_request_cart_item.dart';

/// Stock request state
class StockRequestState extends Equatable {
  final BlocStatus status;
  final List<StockRequestEntity> requests;
  final StockRequestEntity? createdRequest;
  final String? errorMessage;
  
  // Form fields
  final int? selectedProductId;
  final String? selectedProductName;
  final String quantity;
  final int? selectedProductWarehouseStock; // Warehouse stock for selected product
  
  // Multi-product cart
  final List<StockRequestCartItem> cart;
  final int successfulSubmissions;
  final int totalSubmissions;
  
  // Track pending product IDs to prevent duplicates
  final Set<int> pendingProductIds;
  
  // Validation errors
  final String? productError;
  final String? quantityError;
  
  // UI feedback
  final String? snackbarMessage;
  final bool showSuccessSnackbar;
  final bool shouldPop;

  const StockRequestState({
    required this.status,
    required this.requests,
    this.createdRequest,
    this.errorMessage,
    this.selectedProductId,
    this.selectedProductName,
    this.quantity = '',
    this.selectedProductWarehouseStock,
    this.cart = const [],
    this.successfulSubmissions = 0,
    this.totalSubmissions = 0,
    this.pendingProductIds = const {},
    this.productError,
    this.quantityError,
    this.snackbarMessage,
    this.showSuccessSnackbar = false,
    this.shouldPop = false,
  });

  factory StockRequestState.initial() {
    return const StockRequestState(
      status: BlocStatus.initial(),
      requests: [],
      quantity: '',
      cart: [],
      pendingProductIds: {},
    );
  }

  StockRequestState copyWith({
    BlocStatus? status,
    List<StockRequestEntity>? requests,
    StockRequestEntity? createdRequest,
    String? errorMessage,
    int? selectedProductId,
    String? selectedProductName,
    String? quantity,
    int? selectedProductWarehouseStock,
    List<StockRequestCartItem>? cart,
    int? successfulSubmissions,
    int? totalSubmissions,
    Set<int>? pendingProductIds,
    String? productError,
    String? quantityError,
    String? snackbarMessage,
    bool? showSuccessSnackbar,
    bool? shouldPop,
  }) {
    return StockRequestState(
      status: status ?? this.status,
      requests: requests ?? this.requests,
      createdRequest: createdRequest ?? this.createdRequest,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedProductId: selectedProductId ?? this.selectedProductId,
      selectedProductName: selectedProductName ?? this.selectedProductName,
      quantity: quantity ?? this.quantity,
      selectedProductWarehouseStock: selectedProductWarehouseStock ?? this.selectedProductWarehouseStock,
      cart: cart ?? this.cart,
      successfulSubmissions: successfulSubmissions ?? this.successfulSubmissions,
      totalSubmissions: totalSubmissions ?? this.totalSubmissions,
      pendingProductIds: pendingProductIds ?? this.pendingProductIds,
      productError: productError,
      quantityError: quantityError,
      snackbarMessage: snackbarMessage,
      showSuccessSnackbar: showSuccessSnackbar ?? this.showSuccessSnackbar,
      shouldPop: shouldPop ?? this.shouldPop,
    );
  }

  bool get isFormValid => 
      selectedProductId != null && 
      quantity.isNotEmpty && 
      productError == null && 
      quantityError == null;

  bool get isCartValid => cart.isNotEmpty;

  int get cartItemCount => cart.length;

  int get totalCartQuantity => cart.fold(0, (sum, item) => sum + item.quantity);
  
  /// Check if a product has a pending order
  bool hasPendingOrder(int productId) => pendingProductIds.contains(productId);
  
  /// Check if product is in cart
  bool isInCart(int productId) => cart.any((item) => item.productId == productId);

  @override
  List<Object?> get props => [
        status,
        requests,
        createdRequest,
        errorMessage,
        selectedProductId,
        selectedProductName,
        quantity,
        selectedProductWarehouseStock,
        cart,
        successfulSubmissions,
        totalSubmissions,
        pendingProductIds,
        productError,
        quantityError,
        snackbarMessage,
        showSuccessSnackbar,
        shouldPop,
      ];
}
