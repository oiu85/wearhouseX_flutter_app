import 'package:equatable/equatable.dart';

/// Home events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Load dashboard data
class LoadDashboard extends HomeEvent {
  const LoadDashboard();
}

/// Refresh dashboard data
class RefreshDashboard extends HomeEvent {
  const RefreshDashboard();
}

/// Load user information from storage
class LoadUserInfo extends HomeEvent {
  const LoadUserInfo();
}

/// Navigate to create sale page
class NavigateToCreateSale extends HomeEvent {
  const NavigateToCreateSale();
}

/// Navigate to stock page
class NavigateToStock extends HomeEvent {
  const NavigateToStock();
}

/// Navigate to sales history page
class NavigateToSalesHistory extends HomeEvent {
  const NavigateToSalesHistory();
}

/// Navigate to stock detail page
class NavigateToStockDetail extends HomeEvent {
  final int productId;

  const NavigateToStockDetail(this.productId);

  @override
  List<Object?> get props => [productId];
}

/// Navigate to sale detail page
class NavigateToSaleDetail extends HomeEvent {
  final int saleId;

  const NavigateToSaleDetail(this.saleId);

  @override
  List<Object?> get props => [saleId];
}

/// Navigate to notifications page
class NavigateToNotifications extends HomeEvent {
  const NavigateToNotifications();
}

/// Search query changed
class SearchQueryChanged extends HomeEvent {
  final String query;

  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

/// Clear navigation route (after navigation is performed)
class ClearNavigationRoute extends HomeEvent {
  const ClearNavigationRoute();
}
