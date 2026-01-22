import 'package:equatable/equatable.dart';

/// Sort type enum
enum SortType {
  name,
  quantity,
  price,
}

/// Home events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Load stock items
class LoadStock extends HomeEvent {
  const LoadStock();
}

/// Refresh stock items (pull-to-refresh)
class RefreshStock extends HomeEvent {
  const RefreshStock();
}

/// Search stock by product name
class SearchStock extends HomeEvent {
  final String query;

  const SearchStock(this.query);

  @override
  List<Object?> get props => [query];
}

/// Filter by category
class FilterByCategory extends HomeEvent {
  final int? categoryId;

  const FilterByCategory(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

/// Sort stock items
class SortStock extends HomeEvent {
  final SortType sortType;

  const SortStock(this.sortType);

  @override
  List<Object?> get props => [sortType];
}

/// Load user information from storage
class LoadUserInfo extends HomeEvent {
  const LoadUserInfo();
}
