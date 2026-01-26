import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/stock_item_entity.dart';
import '../../domain/repositories/stock_repository.dart';
import 'stock_event.dart';
import 'stock_state.dart';

/// Stock BLoC
class StockBloc extends Bloc<StockEvent, StockState> {
  final StockRepository repository;
  final AppStorageService storageService;

  StockBloc({
    required this.repository,
    required this.storageService,
  }) : super(StockState.initial()) {
    on<LoadUserInfo>(_onLoadUserInfo);
    on<LoadStock>(_onLoadStock);
    on<RefreshStock>(_onRefreshStock);
    on<SearchStock>(_onSearchStock);
    on<FilterByCategory>(_onFilterByCategory);
    on<SortStock>(_onSortStock);
    on<LoadStockStatistics>(_onLoadStockStatistics);
    on<LoadAllProducts>(_onLoadAllProducts);
  }

  Future<void> _onLoadUserInfo(
    LoadUserInfo event,
    Emitter<StockState> emit,
  ) async {
    final userInfo = await storageService.getUserInfo();
    final userName = userInfo?['name'] as String?;
    
    if (userName != null) {
      final greetingText = _getGreeting(userName);
      emit(state.copyWith(
        userName: userName,
        greetingText: greetingText,
      ));
    } else {
      // Fallback to default greeting
      final greetingText = _getGreeting('Driver');
      emit(state.copyWith(
        userName: 'Driver',
        greetingText: greetingText,
      ));
    }
  }

  String _getGreeting(String name) {
    final hour = DateTime.now().hour;
    
    if (hour >= 5 && hour < 12) {
      return 'home.greetingMorning'.tr(namedArgs: {'name': name});
    } else if (hour >= 12 && hour < 17) {
      return 'home.greetingAfternoon'.tr(namedArgs: {'name': name});
    } else if (hour >= 17 && hour < 22) {
      return 'home.greetingEvening'.tr(namedArgs: {'name': name});
    } else {
      return 'home.greeting'.tr(namedArgs: {'name': name});
    }
  }

  Future<void> _onLoadStock(
    LoadStock event,
    Emitter<StockState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    // Convert sort type to API format
    String? sortParam;
    String? orderParam = 'asc';
    switch (state.sortType) {
      case SortType.name:
        sortParam = 'name';
        break;
      case SortType.quantity:
        sortParam = 'quantity';
        orderParam = 'desc';
        break;
      case SortType.price:
        sortParam = 'price';
        break;
    }

    final result = await repository.getDriverStock(
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      categoryId: state.selectedCategoryId,
      sort: sortParam,
      order: orderParam,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (stockItems) {
        final categories = _extractCategories(stockItems);
        final filteredItems = _applyFilters(stockItems, state.searchQuery, state.selectedCategoryId);
        final sortedItems = _applySort(filteredItems, state.sortType);

        emit(state.copyWith(
          status: const BlocStatus.success(),
          stockItems: stockItems,
          filteredStockItems: sortedItems,
          categories: categories,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onRefreshStock(
    RefreshStock event,
    Emitter<StockState> emit,
  ) async {
    // Set status to loadingMore to show refresh indicator while keeping content visible
    emit(state.copyWith(status: const BlocStatus.loadingMore()));

    // Convert sort type to API format
    String? sortParam;
    String? orderParam = 'asc';
    switch (state.sortType) {
      case SortType.name:
        sortParam = 'name';
        break;
      case SortType.quantity:
        sortParam = 'quantity';
        orderParam = 'desc';
        break;
      case SortType.price:
        sortParam = 'price';
        break;
    }

    final result = await repository.getDriverStock(
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      categoryId: state.selectedCategoryId,
      sort: sortParam,
      order: orderParam,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (stockItems) {
        final categories = _extractCategories(stockItems);
        final filteredItems = _applyFilters(stockItems, state.searchQuery, state.selectedCategoryId);
        final sortedItems = _applySort(filteredItems, state.sortType);

        emit(state.copyWith(
          status: const BlocStatus.success(),
          stockItems: stockItems,
          filteredStockItems: sortedItems,
          categories: categories,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onLoadStockStatistics(
    LoadStockStatistics event,
    Emitter<StockState> emit,
  ) async {
    final result = await repository.getStockStatistics(
      lowStockThreshold: event.lowStockThreshold,
    );

    result.fold(
      (failure) {
        // Don't fail the whole state, just log the error
        // Statistics are optional
      },
      (statistics) {
        emit(state.copyWith(
          stockStatistics: statistics,
        ));
      },
    );
  }

  Future<void> _onLoadAllProducts(
    LoadAllProducts event,
    Emitter<StockState> emit,
  ) async {
    emit(state.copyWith(productsStatus: const BlocStatus.loading()));

    final result = await repository.getAllProducts();

    result.fold(
      (failure) {
        emit(state.copyWith(
          productsStatus: BlocStatus.fail(error: failure.message),
        ));
      },
      (products) {
        emit(state.copyWith(
          allProducts: products,
          productsStatus: const BlocStatus.success(),
        ));
      },
    );
  }

  void _onSearchStock(
    SearchStock event,
    Emitter<StockState> emit,
  ) {
    final filteredItems = _applyFilters(state.stockItems, event.query, state.selectedCategoryId);
    final sortedItems = _applySort(filteredItems, state.sortType);

    emit(state.copyWith(
      searchQuery: event.query,
      filteredStockItems: sortedItems,
    ));
  }

  void _onFilterByCategory(
    FilterByCategory event,
    Emitter<StockState> emit,
  ) {
    final filteredItems = _applyFilters(state.stockItems, state.searchQuery, event.categoryId);
    final sortedItems = _applySort(filteredItems, state.sortType);

    emit(state.copyWith(
      selectedCategoryId: event.categoryId,
      filteredStockItems: sortedItems,
    ));
  }

  void _onSortStock(
    SortStock event,
    Emitter<StockState> emit,
  ) {
    final sortedItems = _applySort(state.filteredStockItems, event.sortType);

    emit(state.copyWith(
      sortType: event.sortType,
      filteredStockItems: sortedItems,
    ));
  }

  /// Extract unique categories from stock items
  List<CategoryEntity> _extractCategories(List<StockItemEntity> stockItems) {
    final categoryMap = <int, CategoryEntity>{};
    for (final item in stockItems) {
      final category = item.product.category;
      if (category != null && !categoryMap.containsKey(category.id)) {
        categoryMap[category.id] = category;
      }
    }
    return categoryMap.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  /// Apply search and category filters
  List<StockItemEntity> _applyFilters(
    List<StockItemEntity> items,
    String searchQuery,
    int? categoryId,
  ) {
    var filtered = items;

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((item) {
        return item.product.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    // Apply category filter
    if (categoryId != null) {
      filtered = filtered.where((item) {
        return item.product.categoryId == categoryId;
      }).toList();
    }

    return filtered;
  }

  /// Apply sorting
  List<StockItemEntity> _applySort(
    List<StockItemEntity> items,
    SortType sortType,
  ) {
    final sorted = List<StockItemEntity>.from(items);

    switch (sortType) {
      case SortType.name:
        sorted.sort((a, b) => a.product.name.compareTo(b.product.name));
        break;
      case SortType.quantity:
        //* Sort from maximum to minimum (High to Low)
        sorted.sort((a, b) => b.quantity.compareTo(a.quantity));
        break;
      case SortType.price:
        //* Sort from minimum to maximum (Low to High)
        sorted.sort((a, b) => a.product.price.compareTo(b.product.price));
        break;
    }

    return sorted;
  }
}
