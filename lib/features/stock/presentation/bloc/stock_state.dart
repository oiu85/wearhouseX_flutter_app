import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/stock_item_entity.dart';
import 'stock_event.dart';

/// Stock state
class StockState extends Equatable {
  final BlocStatus status;
  final List<StockItemEntity> stockItems;
  final List<StockItemEntity> filteredStockItems;
  final List<CategoryEntity> categories;
  final String searchQuery;
  final int? selectedCategoryId;
  final SortType sortType;
  final String? errorMessage;
  final String? userName;
  final String? greetingText;

  const StockState({
    required this.status,
    required this.stockItems,
    required this.filteredStockItems,
    required this.categories,
    required this.searchQuery,
    this.selectedCategoryId,
    required this.sortType,
    this.errorMessage,
    this.userName,
    this.greetingText,
  });

  factory StockState.initial() => const StockState(
        status: BlocStatus.initial(),
        stockItems: [],
        filteredStockItems: [],
        categories: [],
        searchQuery: '',
        selectedCategoryId: null,
        sortType: SortType.name,
        errorMessage: null,
        userName: null,
        greetingText: null,
      );

  StockState copyWith({
    BlocStatus? status,
    List<StockItemEntity>? stockItems,
    List<StockItemEntity>? filteredStockItems,
    List<CategoryEntity>? categories,
    String? searchQuery,
    int? selectedCategoryId,
    SortType? sortType,
    String? errorMessage,
    String? userName,
    String? greetingText,
  }) {
    return StockState(
      status: status ?? this.status,
      stockItems: stockItems ?? this.stockItems,
      filteredStockItems: filteredStockItems ?? this.filteredStockItems,
      categories: categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      sortType: sortType ?? this.sortType,
      errorMessage: errorMessage ?? this.errorMessage,
      userName: userName ?? this.userName,
      greetingText: greetingText ?? this.greetingText,
    );
  }

  @override
  List<Object?> get props => [
        status,
        stockItems,
        filteredStockItems,
        categories,
        searchQuery,
        selectedCategoryId,
        sortType,
        errorMessage,
        userName,
        greetingText,
      ];
}
