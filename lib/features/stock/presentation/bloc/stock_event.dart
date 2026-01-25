import 'package:equatable/equatable.dart';

/// Sort type enum
enum SortType {
  name,
  quantity,
  price,
}

/// Stock events
abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object?> get props => [];
}

/// Load stock items
class LoadStock extends StockEvent {
  const LoadStock();
}

/// Refresh stock items (pull-to-refresh)
class RefreshStock extends StockEvent {
  const RefreshStock();
}

/// Search stock by product name
class SearchStock extends StockEvent {
  final String query;

  const SearchStock(this.query);

  @override
  List<Object?> get props => [query];
}

/// Filter by category
class FilterByCategory extends StockEvent {
  final int? categoryId;

  const FilterByCategory(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

/// Sort stock items
class SortStock extends StockEvent {
  final SortType sortType;

  const SortStock(this.sortType);

  @override
  List<Object?> get props => [sortType];
}

/// Load user information from storage
class LoadUserInfo extends StockEvent {
  const LoadUserInfo();
}

/// Load stock statistics
class LoadStockStatistics extends StockEvent {
  final int? lowStockThreshold;

  const LoadStockStatistics({this.lowStockThreshold});

  @override
  List<Object?> get props => [lowStockThreshold];
}
