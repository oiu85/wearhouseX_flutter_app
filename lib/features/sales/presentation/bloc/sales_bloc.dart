import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/services/pdf_service.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../data/datasources/cart_local_datasource.dart';
import '../../domain/repositories/sales_repository.dart';
import 'sales_event.dart';
import 'sales_state.dart';

// ============================================
// CREATE SALE BLOC
// ============================================

class CreateSaleBloc extends Bloc<CreateSaleEvent, CreateSaleState> {
  final SalesRepository repository;
  final CartLocalDataSource cartLocalDataSource;

  CreateSaleBloc({
    required this.repository,
    required this.cartLocalDataSource,
  }) : super(CreateSaleState.initial()) {
    on<LoadCartFromStorage>(_onLoadCartFromStorage);
    on<LoadAllProducts>(_onLoadAllProducts);
    on<SearchProducts>(_onSearchProducts);
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<UpdateCartItemCustomPrice>(_onUpdateCartItemCustomPrice);
    on<UpdateCartItemPricePercentage>(_onUpdateCartItemPricePercentage);
    on<ApplyGlobalPricePercentage>(_onApplyGlobalPricePercentage);
    on<ToggleProductSelection>(_onToggleProductSelection);
    on<AddMultipleProductsToCart>(_onAddMultipleProductsToCart);
    on<ClearMultiSelectSelections>(_onClearMultiSelectSelections);
    on<ToggleMultiSelectExpanded>(_onToggleMultiSelectExpanded);
    on<CreateSaleSubmitted>(_onCreateSaleSubmitted);
    on<CreateSaleReset>(_onCreateSaleReset);
    on<ClearCart>(_onClearCart);
    
    // Load cart from storage and products on initialization
    add(const LoadCartFromStorage());
    add(const LoadAllProducts());
  }

  Future<void> _onLoadCartFromStorage(
    LoadCartFromStorage event,
    Emitter<CreateSaleState> emit,
  ) async {
    try {
      final cartItems = await cartLocalDataSource.getCartItems();
      emit(state.copyWith(
        cartItems: cartItems,
        status: const BlocStatus.success(),
        errorMessage: null,
      ));
    } catch (e) {
      // If loading fails, start with empty cart
      emit(state.copyWith(
        cartItems: [],
        status: const BlocStatus.success(),
        errorMessage: null,
      ));
    }
  }

  Future<void> _saveCartToStorage(List<CartItem> items) async {
    try {
      await cartLocalDataSource.saveCartItems(items);
    } catch (e) {
      // Silently fail - cart persistence is not critical
    }
  }

  Future<void> _onAddProductToCart(
    AddProductToCart event,
    Emitter<CreateSaleState> emit,
  ) async {
    final existingItemIndex = state.cartItems.indexWhere(
      (item) => item.productId == event.productId,
    );

    if (existingItemIndex >= 0) {
      // Update quantity if item already exists
      final existingItem = state.cartItems[existingItemIndex];
      final newQuantity = existingItem.quantity + 1;
      
      if (newQuantity > event.availableQuantity) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          errorMessage: 'Quantity exceeds available stock',
        ));
        return;
      }

      final updatedItems = List<CartItem>.from(state.cartItems);
      updatedItems[existingItemIndex] = existingItem.copyWith(quantity: newQuantity);

      emit(state.copyWith(
        cartItems: updatedItems,
        status: const BlocStatus.success(),
        errorMessage: null,
      ));
      await _saveCartToStorage(updatedItems);
    } else {
      // Add new item to cart
      final newItem = CartItem(
        productId: event.productId,
        productName: event.productName,
        price: event.price,
        quantity: 1,
        availableQuantity: event.availableQuantity,
      );

      final updatedItems = [...state.cartItems, newItem];
      emit(state.copyWith(
        cartItems: updatedItems,
        status: const BlocStatus.success(),
        errorMessage: null,
      ));
      await _saveCartToStorage(updatedItems);
    }
  }

  Future<void> _onRemoveProductFromCart(
    RemoveProductFromCart event,
    Emitter<CreateSaleState> emit,
  ) async {
    final updatedItems = state.cartItems.where(
      (item) => item.productId != event.productId,
    ).toList();

    emit(state.copyWith(
      cartItems: updatedItems,
      status: const BlocStatus.success(),
      errorMessage: null,
    ));
    await _saveCartToStorage(updatedItems);
  }

  Future<void> _onUpdateCartItemQuantity(
    UpdateCartItemQuantity event,
    Emitter<CreateSaleState> emit,
  ) async {
    final itemIndex = state.cartItems.indexWhere(
      (item) => item.productId == event.productId,
    );

    if (itemIndex < 0) return;

    final item = state.cartItems[itemIndex];
    
    if (event.quantity <= 0) {
      // Remove item if quantity is 0 or less
      await _onRemoveProductFromCart(RemoveProductFromCart(event.productId), emit);
      return;
    }

    if (event.quantity > item.availableQuantity) {
      emit(state.copyWith(
        status: const BlocStatus.success(),
        errorMessage: 'Quantity exceeds available stock',
      ));
      return;
    }

    final updatedItems = List<CartItem>.from(state.cartItems);
    updatedItems[itemIndex] = item.copyWith(quantity: event.quantity);

    emit(state.copyWith(
      cartItems: updatedItems,
      status: const BlocStatus.success(),
      errorMessage: null,
    ));
    await _saveCartToStorage(updatedItems);
  }

  Future<void> _onUpdateCartItemCustomPrice(
    UpdateCartItemCustomPrice event,
    Emitter<CreateSaleState> emit,
  ) async {
    final itemIndex = state.cartItems.indexWhere(
      (item) => item.productId == event.productId,
    );

    if (itemIndex < 0) return;

    final item = state.cartItems[itemIndex];
    final updatedItems = List<CartItem>.from(state.cartItems);
    updatedItems[itemIndex] = item.copyWith(
      customPrice: event.customPrice,
      pricePercentage: null, // Clear percentage when custom price is set
    );

    emit(state.copyWith(
      cartItems: updatedItems,
      status: const BlocStatus.success(),
      errorMessage: null,
    ));
    await _saveCartToStorage(updatedItems);
  }

  Future<void> _onUpdateCartItemPricePercentage(
    UpdateCartItemPricePercentage event,
    Emitter<CreateSaleState> emit,
  ) async {
    final itemIndex = state.cartItems.indexWhere(
      (item) => item.productId == event.productId,
    );

    if (itemIndex < 0) return;

    final item = state.cartItems[itemIndex];
    final calculatedPrice = event.percentage != null
        ? item.price * (1 + event.percentage! / 100)
        : null;

    final updatedItems = List<CartItem>.from(state.cartItems);
    updatedItems[itemIndex] = item.copyWith(
      customPrice: calculatedPrice,
      pricePercentage: event.percentage,
    );

    emit(state.copyWith(
      cartItems: updatedItems,
      status: const BlocStatus.success(),
      errorMessage: null,
    ));
    await _saveCartToStorage(updatedItems);
  }

  Future<void> _onApplyGlobalPricePercentage(
    ApplyGlobalPricePercentage event,
    Emitter<CreateSaleState> emit,
  ) async {
    final updatedItems = state.cartItems.map((item) {
      final calculatedPrice = item.price * (1 + event.percentage / 100);
      return item.copyWith(
        customPrice: calculatedPrice,
        pricePercentage: event.percentage,
      );
    }).toList();

    emit(state.copyWith(
      cartItems: updatedItems,
      status: const BlocStatus.success(),
      errorMessage: null,
    ));
    await _saveCartToStorage(updatedItems);
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
        // Clear cart on successful sale
        cartLocalDataSource.clearCartItems();
        emit(state.copyWith(
          status: const BlocStatus.success(),
          createdSale: sale,
          cartItems: [],
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

  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CreateSaleState> emit,
  ) async {
    await cartLocalDataSource.clearCartItems();
    emit(state.copyWith(
      cartItems: [],
      status: const BlocStatus.success(),
      errorMessage: null,
    ));
  }

  void _onToggleProductSelection(
    ToggleProductSelection event,
    Emitter<CreateSaleState> emit,
  ) {
    final updatedSelections = Set<int>.from(state.selectedProductIds);
    if (updatedSelections.contains(event.productId)) {
      updatedSelections.remove(event.productId);
    } else {
      updatedSelections.add(event.productId);
    }

    emit(state.copyWith(
      selectedProductIds: updatedSelections,
    ));
  }

  Future<void> _onAddMultipleProductsToCart(
    AddMultipleProductsToCart event,
    Emitter<CreateSaleState> emit,
  ) async {
    if (event.products.isEmpty) return;

    final updatedItems = List<CartItem>.from(state.cartItems);

    for (final productData in event.products) {
      if (productData.availableQuantity <= 0) continue;

      final existingItemIndex = updatedItems.indexWhere(
        (item) => item.productId == productData.productId,
      );

      if (existingItemIndex >= 0) {
        // Update quantity if item already exists
        final existingItem = updatedItems[existingItemIndex];
        final newQuantity = existingItem.quantity + 1;

        if (newQuantity > productData.availableQuantity) {
          continue; // Skip if exceeds available quantity
        }

        updatedItems[existingItemIndex] = existingItem.copyWith(quantity: newQuantity);
      } else {
        // Add new item to cart
        final newItem = CartItem(
          productId: productData.productId,
          productName: productData.productName,
          price: productData.price,
          quantity: 1,
          availableQuantity: productData.availableQuantity,
        );
        updatedItems.add(newItem);
      }
    }

    emit(state.copyWith(
      cartItems: updatedItems,
      status: const BlocStatus.success(),
      errorMessage: null,
      selectedProductIds: {},
    ));
    await _saveCartToStorage(updatedItems);
  }

  void _onClearMultiSelectSelections(
    ClearMultiSelectSelections event,
    Emitter<CreateSaleState> emit,
  ) {
    emit(state.copyWith(
      selectedProductIds: {},
    ));
  }

  void _onToggleMultiSelectExpanded(
    ToggleMultiSelectExpanded event,
    Emitter<CreateSaleState> emit,
  ) {
    emit(state.copyWith(
      isMultiSelectExpanded: !state.isMultiSelectExpanded,
    ));
  }

  Future<void> _onLoadAllProducts(
    LoadAllProducts event,
    Emitter<CreateSaleState> emit,
  ) async {
    emit(state.copyWith(productsStatus: const BlocStatus.loading()));

    final result = await repository.getAllDriverStock();

    result.fold(
      (failure) {
        emit(state.copyWith(
          productsStatus: BlocStatus.fail(error: failure.message),
        ));
      },
      (products) {
        emit(state.copyWith(
          allProducts: products,
          filteredProducts: products,
          productsStatus: const BlocStatus.success(),
        ));
      },
    );
  }

  void _onSearchProducts(
    SearchProducts event,
    Emitter<CreateSaleState> emit,
  ) {
    final query = event.query.toLowerCase();
    
    if (query.isEmpty) {
      emit(state.copyWith(
        filteredProducts: state.allProducts,
        productSearchQuery: '',
      ));
      return;
    }

    final filtered = state.allProducts.where((product) {
      return product.product.name.toLowerCase().contains(query);
    }).toList();

    emit(state.copyWith(
      filteredProducts: filtered,
      productSearchQuery: event.query,
    ));
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

    if (result.isLeft()) {
      final failure = result.fold((l) => l, (r) => throw Exception('Expected Left'));
      emit(state.copyWith(
        isDownloadingInvoice: false,
        errorMessage: failure.message,
      ));
      return;
    }

    // Handle success case with async operations
    final bytes = result.fold((l) => throw Exception('Expected Right'), (r) => r);
    
    try {
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
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          isDownloadingInvoice: false,
          errorMessage: 'Failed to save PDF file. Please check storage permissions.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isDownloadingInvoice: false,
        errorMessage: 'Failed to save PDF file: ${e.toString()}',
      ));
    }
  }

  Future<void> _onShareInvoice(
    ShareInvoice event,
    Emitter<SaleDetailState> emit,
  ) async {
    emit(state.copyWith(isSharingInvoice: true));

    final result = await repository.getInvoicePdf(event.saleId);

    if (result.isLeft()) {
      final failure = result.fold((l) => l, (r) => throw Exception('Expected Left'));
      emit(state.copyWith(
        isSharingInvoice: false,
        errorMessage: failure.message,
      ));
      return;
    }

    // Handle success case with async operations
    final bytes = result.fold((l) => throw Exception('Expected Right'), (r) => r);
    
    try {
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
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          isSharingInvoice: false,
          errorMessage: 'Failed to share PDF file. Please check storage permissions.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isSharingInvoice: false,
        errorMessage: 'Failed to share PDF file: ${e.toString()}',
      ));
    }
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
