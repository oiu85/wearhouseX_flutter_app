import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/services/pdf_service.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/repositories/sales_repository.dart';
import '../../domain/entities/sale_item_entity.dart';
import 'sales_event.dart';
import 'sales_state.dart';

// ============================================
// CREATE SALE BLOC
// ============================================

class CreateSaleBloc extends Bloc<CreateSaleEvent, CreateSaleState> {
  final SalesRepository repository;

  CreateSaleBloc({
    required this.repository,
  }) : super(CreateSaleState.initial()) {
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<CreateSaleSubmitted>(_onCreateSaleSubmitted);
    on<CreateSaleReset>(_onCreateSaleReset);
  }

  void _onAddProductToCart(
    AddProductToCart event,
    Emitter<CreateSaleState> emit,
  ) {
    final existingItemIndex = state.cartItems.indexWhere(
      (item) => item.productId == event.productId,
    );

    if (existingItemIndex >= 0) {
      // Update quantity if item already exists
      final existingItem = state.cartItems[existingItemIndex];
      final newQuantity = existingItem.quantity + 1;
      
      if (newQuantity > event.availableQuantity) {
        emit(state.copyWith(
          errorMessage: 'Quantity exceeds available stock',
        ));
        return;
      }

      final updatedItems = List<CartItem>.from(state.cartItems);
      updatedItems[existingItemIndex] = existingItem.copyWith(quantity: newQuantity);

      emit(state.copyWith(
        cartItems: updatedItems,
        errorMessage: null,
      ));
    } else {
      // Add new item to cart
      final newItem = CartItem(
        productId: event.productId,
        productName: event.productName,
        price: event.price,
        quantity: 1,
        availableQuantity: event.availableQuantity,
      );

      emit(state.copyWith(
        cartItems: [...state.cartItems, newItem],
        errorMessage: null,
      ));
    }
  }

  void _onRemoveProductFromCart(
    RemoveProductFromCart event,
    Emitter<CreateSaleState> emit,
  ) {
    final updatedItems = state.cartItems.where(
      (item) => item.productId != event.productId,
    ).toList();

    emit(state.copyWith(
      cartItems: updatedItems,
      errorMessage: null,
    ));
  }

  void _onUpdateCartItemQuantity(
    UpdateCartItemQuantity event,
    Emitter<CreateSaleState> emit,
  ) {
    final itemIndex = state.cartItems.indexWhere(
      (item) => item.productId == event.productId,
    );

    if (itemIndex < 0) return;

    final item = state.cartItems[itemIndex];
    
    if (event.quantity <= 0) {
      // Remove item if quantity is 0 or less
      _onRemoveProductFromCart(RemoveProductFromCart(event.productId), emit);
      return;
    }

    if (event.quantity > item.availableQuantity) {
      emit(state.copyWith(
        errorMessage: 'Quantity exceeds available stock',
      ));
      return;
    }

    final updatedItems = List<CartItem>.from(state.cartItems);
    updatedItems[itemIndex] = item.copyWith(quantity: event.quantity);

    emit(state.copyWith(
      cartItems: updatedItems,
      errorMessage: null,
    ));
  }

  Future<void> _onCreateSaleSubmitted(
    CreateSaleSubmitted event,
    Emitter<CreateSaleState> emit,
  ) async {
    if (event.customerName.trim().isEmpty) {
      emit(state.copyWith(
        errorMessage: 'Customer name is required',
      ));
      return;
    }

    if (event.items.isEmpty) {
      emit(state.copyWith(
        errorMessage: 'Please add at least one product to the cart',
      ));
      return;
    }

    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.createSale(
      customerName: event.customerName.trim(),
      items: event.items,
    );

    result.fold(
      (failure) {
        String errorMessage = failure.message;

        if (failure is NetworkFailure) {
          if (failure.message.contains('connection') ||
              failure.message.contains('timeout')) {
            errorMessage = 'Connection error. Please check your internet.';
          } else if (failure.message.contains('validation') ||
              failure.message.contains('stock')) {
            errorMessage = 'Invalid sale data. Please check your input.';
          }
        }

        emit(state.copyWith(
          status: BlocStatus.fail(error: errorMessage),
          errorMessage: errorMessage,
        ));
      },
      (sale) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          createdSale: sale,
          errorMessage: null,
        ));
      },
    );
  }

  void _onCreateSaleReset(
    CreateSaleReset event,
    Emitter<CreateSaleState> emit,
  ) {
    emit(CreateSaleState.initial());
  }
}

// ============================================
// SALES LIST BLOC
// ============================================

class SalesListBloc extends Bloc<SalesListEvent, SalesListState> {
  final SalesRepository repository;

  SalesListBloc({
    required this.repository,
  }) : super(SalesListState.initial()) {
    on<LoadSales>(_onLoadSales);
    on<RefreshSales>(_onRefreshSales);
    on<SearchSales>(_onSearchSales);
    on<FilterSalesByDate>(_onFilterSalesByDate);
    on<SortSales>(_onSortSales);
  }

  Future<void> _onLoadSales(
    LoadSales event,
    Emitter<SalesListState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.getSales(
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      dateFrom: state.dateFrom,
      dateTo: state.dateTo,
      sort: state.sortBy,
      order: state.sortOrder,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (sales) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          sales: sales,
          filteredSales: sales,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onRefreshSales(
    RefreshSales event,
    Emitter<SalesListState> emit,
  ) async {
    final result = await repository.getSales(
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      dateFrom: state.dateFrom,
      dateTo: state.dateTo,
      sort: state.sortBy,
      order: state.sortOrder,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (sales) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          sales: sales,
          filteredSales: sales,
          errorMessage: null,
        ));
      },
    );
  }

  void _onSearchSales(
    SearchSales event,
    Emitter<SalesListState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
    add(const LoadSales());
  }

  void _onFilterSalesByDate(
    FilterSalesByDate event,
    Emitter<SalesListState> emit,
  ) {
    emit(state.copyWith(
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
    ));
    add(const LoadSales());
  }

  void _onSortSales(
    SortSales event,
    Emitter<SalesListState> emit,
  ) {
    emit(state.copyWith(
      sortBy: event.sortBy,
      sortOrder: event.order,
    ));
    add(const LoadSales());
  }
}

// ============================================
// SALE DETAIL BLOC
// ============================================

class SaleDetailBloc extends Bloc<SaleDetailEvent, SaleDetailState> {
  final SalesRepository repository;

  SaleDetailBloc({
    required this.repository,
  }) : super(SaleDetailState.initial()) {
    on<LoadSaleDetail>(_onLoadSaleDetail);
    on<ResetSaleDetail>(_onResetSaleDetail);
    on<DownloadInvoice>(_onDownloadInvoice);
    on<ShareInvoice>(_onShareInvoice);
  }

  Future<void> _onLoadSaleDetail(
    LoadSaleDetail event,
    Emitter<SaleDetailState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.getSaleDetail(event.saleId);

    result.fold(
      (failure) {
        String errorMessage = failure.message;

        if (failure is NetworkFailure) {
          if (failure.message.contains('not found')) {
            errorMessage = 'Sale not found.';
          } else if (failure.message.contains('connection')) {
            errorMessage = 'Connection error. Please check your internet.';
          }
        }

        emit(state.copyWith(
          status: BlocStatus.fail(error: errorMessage),
          errorMessage: errorMessage,
        ));
      },
      (sale) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          sale: sale,
          errorMessage: null,
        ));
      },
    );
  }

  void _onResetSaleDetail(
    ResetSaleDetail event,
    Emitter<SaleDetailState> emit,
  ) {
    emit(SaleDetailState.initial());
  }

  Future<void> _onDownloadInvoice(
    DownloadInvoice event,
    Emitter<SaleDetailState> emit,
  ) async {
    emit(state.copyWith(isDownloadingInvoice: true));

    final result = await repository.getInvoicePdf(event.saleId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isDownloadingInvoice: false,
          errorMessage: failure.message,
        ));
      },
      (bytes) async {
        // Save PDF file
        final pdfService = PdfService();
        final fileName = 'invoice_${event.saleId}.pdf';
        final filePath = await pdfService.savePdf(
          bytes: bytes,
          fileName: fileName,
        );

        if (filePath != null) {
          emit(state.copyWith(
            isDownloadingInvoice: false,
          ));
        } else {
          emit(state.copyWith(
            isDownloadingInvoice: false,
            errorMessage: 'Failed to save PDF file',
          ));
        }
      },
    );
  }

  Future<void> _onShareInvoice(
    ShareInvoice event,
    Emitter<SaleDetailState> emit,
  ) async {
    emit(state.copyWith(isSharingInvoice: true));

    final result = await repository.getInvoicePdf(event.saleId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isSharingInvoice: false,
          errorMessage: failure.message,
        ));
      },
      (bytes) async {
        // Share PDF file
        final pdfService = PdfService();
        final fileName = 'invoice_${event.saleId}.pdf';
        final success = await pdfService.downloadAndSharePdf(
          bytes: bytes,
          fileName: fileName,
          subject: 'Invoice ${event.saleId}',
        );

        if (success) {
          emit(state.copyWith(
            isSharingInvoice: false,
          ));
        } else {
          emit(state.copyWith(
            isSharingInvoice: false,
            errorMessage: 'Failed to share PDF file',
          ));
        }
      },
    );
  }
}

// ============================================
// SALES STATISTICS BLOC
// ============================================

class SalesStatisticsBloc extends Bloc<SalesStatisticsEvent, SalesStatisticsState> {
  final SalesRepository repository;

  SalesStatisticsBloc({
    required this.repository,
  }) : super(SalesStatisticsState.initial()) {
    on<LoadSalesStatistics>(_onLoadSalesStatistics);
  }

  Future<void> _onLoadSalesStatistics(
    LoadSalesStatistics event,
    Emitter<SalesStatisticsState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.getSalesStatistics();

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (statistics) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          statistics: statistics,
          errorMessage: null,
        ));
      },
    );
  }
}
