import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/repositories/stock_request_repository.dart';
import 'stock_request_event.dart';
import 'stock_request_state.dart';

/// Stock request BLoC
class StockRequestBloc extends Bloc<StockRequestEvent, StockRequestState> {
  final StockRequestRepository _repository;

  StockRequestBloc({
    required StockRequestRepository repository,
  })  : _repository = repository,
        super(StockRequestState.initial()) {
    on<InitializeStockRequestForm>(_onInitializeStockRequestForm);
    on<SelectProduct>(_onSelectProduct);
    on<SetQuantity>(_onSetQuantity);
    on<ValidateForm>(_onValidateForm);
    on<SubmitStockRequest>(_onSubmitStockRequest);
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
        emit(state.copyWith(
          status: const BlocStatus.success(),
          requests: requests,
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
