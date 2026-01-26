import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/repositories/stock_request_repository.dart';
import '../../domain/entities/stock_request_cart_item.dart';
import 'stock_request_event.dart';
import 'stock_request_state.dart';

/// Stock request BLoC with multi-product support
class StockRequestBloc extends Bloc<StockRequestEvent, StockRequestState> {
  final StockRequestRepository _repository;

  StockRequestBloc({
    required StockRequestRepository repository,
  })  : _repository = repository,
        super(StockRequestState.initial()) {
    on<InitializeStockRequestForm>(_onInitializeStockRequestForm);
    on<SelectProduct>(_onSelectProduct);
    on<SetQuantity>(_onSetQuantity);
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<UpdateCartProductQuantity>(_onUpdateCartProductQuantity);
    on<ClearCart>(_onClearCart);
    on<ValidateForm>(_onValidateForm);
    on<SubmitStockRequest>(_onSubmitStockRequest);
    on<SubmitMultiProductRequest>(_onSubmitMultiProductRequest);
    on<LoadStockRequests>(_onLoadStockRequests);
    on<ResetStockRequest>(_onResetStockRequest);
    on<ClearSnackbarMessage>(_onClearSnackbarMessage);
  }

  void _onInitializeStockRequestForm(
    InitializeStockRequestForm event,
    Emitter<StockRequestState> emit,
  ) {
    emit(state.copyWith(
      selectedProductId: event.productId,
      selectedProductName: event.productName,
      quantity: event.initialQuantity?.toString() ?? '',
      productError: null,
      quantityError: null,
    ));
  }

  void _onSelectProduct(
    SelectProduct event,
    Emitter<StockRequestState> emit,
  ) {
    emit(state.copyWith(
      selectedProductId: event.productId,
      selectedProductWarehouseStock: event.warehouseStock,
      productError: null,
      quantityError: null, // Clear quantity error when product changes
    ));
  }

  void _onSetQuantity(
    SetQuantity event,
    Emitter<StockRequestState> emit,
  ) {
    emit(state.copyWith(
      quantity: event.quantity,
      quantityError: null,
    ));
  }

  void _onAddProductToCart(
    AddProductToCart event,
    Emitter<StockRequestState> emit,
  ) {
    // Check if product has pending order
    if (state.hasPendingOrder(event.productId)) {
      emit(state.copyWith(
        snackbarMessage: 'stockRequest.pendingOrderExists',
        showSuccessSnackbar: false,
      ));
      return;
    }
    
    // Check if product already in cart
    final existingIndex = state.cart.indexWhere((item) => item.productId == event.productId);
    
    if (existingIndex != -1) {
      // Update existing item
      final updatedCart = List<StockRequestCartItem>.from(state.cart);
      updatedCart[existingIndex] = updatedCart[existingIndex].copyWith(
        quantity: event.quantity,
      );
      
      emit(state.copyWith(
        cart: updatedCart,
        snackbarMessage: 'stockRequest.productUpdatedInCart',
        showSuccessSnackbar: true,
        // Reset form fields
        selectedProductId: null,
        selectedProductName: null,
        quantity: '',
        selectedProductWarehouseStock: null,
        productError: null,
        quantityError: null,
      ));
    } else {
      // Add new item
      final newItem = StockRequestCartItem(
        productId: event.productId,
        productName: event.productName,
        quantity: event.quantity,
        warehouseStock: event.warehouseStock,
      );
      
      emit(state.copyWith(
        cart: [...state.cart, newItem],
        snackbarMessage: 'stockRequest.productAddedToCart',
        showSuccessSnackbar: true,
        // Reset form fields
        selectedProductId: null,
        selectedProductName: null,
        quantity: '',
        selectedProductWarehouseStock: null,
        productError: null,
        quantityError: null,
      ));
    }
  }

  void _onRemoveProductFromCart(
    RemoveProductFromCart event,
    Emitter<StockRequestState> emit,
  ) {
    final updatedCart = state.cart.where((item) => item.productId != event.productId).toList();
    
    emit(state.copyWith(
      cart: updatedCart,
      snackbarMessage: 'stockRequest.productRemovedFromCart',
      showSuccessSnackbar: true,
    ));
  }

  void _onUpdateCartProductQuantity(
    UpdateCartProductQuantity event,
    Emitter<StockRequestState> emit,
  ) {
    final updatedCart = state.cart.map((item) {
      if (item.productId == event.productId) {
        return item.copyWith(quantity: event.quantity);
      }
      return item;
    }).toList();
    
    emit(state.copyWith(cart: updatedCart));
  }

  void _onClearCart(
    ClearCart event,
    Emitter<StockRequestState> emit,
  ) {
    emit(state.copyWith(
      cart: [],
      successfulSubmissions: 0,
      totalSubmissions: 0,
    ));
  }

  void _onValidateForm(
    ValidateForm event,
    Emitter<StockRequestState> emit,
  ) {
    String? productError;
    String? quantityError;

    if (state.selectedProductId == null) {
      productError = 'stockRequest.productRequired';
    }

    if (state.quantity.isEmpty) {
      quantityError = 'stockRequest.quantityRequired';
    } else {
      final quantity = int.tryParse(state.quantity);
      if (quantity == null || quantity <= 0) {
        quantityError = 'stockRequest.quantityInvalid';
      } else {
        // Validate against warehouse stock
        final warehouseStock = state.selectedProductWarehouseStock ?? 0;
        if (quantity > warehouseStock) {
          quantityError = 'stockRequest.quantityExceedsStock';
        }
      }
    }

    emit(state.copyWith(
      productError: productError,
      quantityError: quantityError,
    ));
  }

  Future<void> _onSubmitStockRequest(
    SubmitStockRequest event,
    Emitter<StockRequestState> emit,
  ) async {
    // Validate first
    add(const ValidateForm());
    
    // Wait a bit for validation to complete
    await Future.delayed(const Duration(milliseconds: 50));
    
    if (!state.isFormValid) {
      emit(state.copyWith(
        snackbarMessage: state.productError ?? state.quantityError,
        showSuccessSnackbar: false,
      ));
      return;
    }

    emit(state.copyWith(
      status: const BlocStatus.loading(),
      snackbarMessage: null,
    ));

    final result = await _repository.createRequest(
      productId: state.selectedProductId!,
      quantity: int.parse(state.quantity),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
          snackbarMessage: 'stockRequest.requestFailed',
          showSuccessSnackbar: false,
        ));
      },
      (request) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          createdRequest: request,
          errorMessage: null,
          snackbarMessage: 'stockRequest.requestSubmitted',
          showSuccessSnackbar: true,
          shouldPop: true,
        ));
        // Reload requests list
        add(const LoadStockRequests());
      },
    );
  }

  Future<void> _onSubmitMultiProductRequest(
    SubmitMultiProductRequest event,
    Emitter<StockRequestState> emit,
  ) async {
    if (state.cart.isEmpty) {
      emit(state.copyWith(
        snackbarMessage: 'stockRequest.noProductsAdded',
        showSuccessSnackbar: false,
      ));
      return;
    }

    emit(state.copyWith(
      status: const BlocStatus.loading(),
      snackbarMessage: null,
      successfulSubmissions: 0,
      totalSubmissions: state.cart.length,
    ));

    int successCount = 0;
    final List<String> errors = [];
    final List<int> successfulProductIds = [];

    // Submit each cart item as a separate request
    for (final item in state.cart) {
      final result = await _repository.createRequest(
        productId: item.productId,
        quantity: item.quantity,
      );

      result.fold(
        (failure) {
          // Parse backend error message
          String errorMsg = failure.message;
          
          // Check for specific error messages
          if (errorMsg.toLowerCase().contains('pending order')) {
            errorMsg = 'stockRequest.pendingOrderExists';
          }
          
          errors.add('${item.productName}: $errorMsg');
        },
        (request) {
          successCount++;
          successfulProductIds.add(item.productId);
        },
      );

      // Emit progress updates
      emit(state.copyWith(
        successfulSubmissions: successCount,
      ));
    }

    // Remove successfully submitted items from cart
    final remainingCart = state.cart.where((item) => 
      !successfulProductIds.contains(item.productId)
    ).toList();

    if (successCount == state.cart.length) {
      // All requests successful
      emit(state.copyWith(
        status: const BlocStatus.success(),
        cart: [], // Clear cart
        snackbarMessage: 'stockRequest.allRequestsSubmitted',
        showSuccessSnackbar: true,
        shouldPop: true,
        successfulSubmissions: successCount,
      ));
      // Reload requests list
      add(const LoadStockRequests());
    } else if (successCount > 0) {
      // Partial success - show detailed message with count
      final failedCount = state.cart.length - successCount;
      
      emit(state.copyWith(
        status: const BlocStatus.success(),
        cart: remainingCart, // Keep failed items in cart
        snackbarMessage: 'stockRequest.requestsSubmittedWithErrors',
        showSuccessSnackbar: false,
        successfulSubmissions: successCount,
      ));
      
      // Show error details for failed items
      if (errors.isNotEmpty) {
        // Log errors for debugging
        for (final error in errors) {
          print('Stock Request Error: $error');
        }
      }
      
      // Reload requests list to show successful ones
      add(const LoadStockRequests());
    } else {
      // All failed
      emit(state.copyWith(
        status: BlocStatus.fail(error: errors.join('\n')),
        errorMessage: errors.join('\n'),
        snackbarMessage: 'stockRequest.allRequestsFailed',
        showSuccessSnackbar: false,
      ));
    }
  }

  Future<void> _onLoadStockRequests(
    LoadStockRequests event,
    Emitter<StockRequestState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await _repository.getRequests();

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (requests) {
        // Extract pending product IDs
        final pendingIds = requests
            .where((request) => request.status.toLowerCase() == 'pending')
            .map((request) => request.productId)
            .toSet();
        
        emit(state.copyWith(
          status: const BlocStatus.success(),
          requests: requests,
          pendingProductIds: pendingIds,
          errorMessage: null,
        ));
      },
    );
  }

  void _onResetStockRequest(
    ResetStockRequest event,
    Emitter<StockRequestState> emit,
  ) {
    emit(StockRequestState.initial());
  }

  void _onClearSnackbarMessage(
    ClearSnackbarMessage event,
    Emitter<StockRequestState> emit,
  ) {
    emit(state.copyWith(
      snackbarMessage: null,
      showSuccessSnackbar: false,
      shouldPop: false,
    ));
  }
}
