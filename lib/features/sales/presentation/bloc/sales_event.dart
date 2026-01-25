import 'package:equatable/equatable.dart';
import '../../domain/entities/sale_item_entity.dart';

/// Sales events
abstract class SalesEvent extends Equatable {
  const SalesEvent();

  @override
  List<Object?> get props => [];
}

// ============================================
// CREATE SALE EVENTS
// ============================================

abstract class CreateSaleEvent extends Equatable {
  const CreateSaleEvent();

  @override
  List<Object?> get props => [];
}

class CreateSaleSubmitted extends CreateSaleEvent {
  final String customerName;
  final List<SaleItemEntity> items;

  const CreateSaleSubmitted({
    required this.customerName,
    required this.items,
  });

  @override
  List<Object?> get props => [customerName, items];
}

class CreateSaleReset extends CreateSaleEvent {
  const CreateSaleReset();
}

class AddProductToCart extends CreateSaleEvent {
  final int productId;
  final String productName;
  final double price;
  final int availableQuantity;

  const AddProductToCart({
    required this.productId,
    required this.productName,
    required this.price,
    required this.availableQuantity,
  });

  @override
  List<Object?> get props => [productId, productName, price, availableQuantity];
}

class RemoveProductFromCart extends CreateSaleEvent {
  final int productId;

  const RemoveProductFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateCartItemQuantity extends CreateSaleEvent {
  final int productId;
  final int quantity;

  const UpdateCartItemQuantity({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];
}

class LoadCartFromStorage extends CreateSaleEvent {
  const LoadCartFromStorage();
}

class ClearCart extends CreateSaleEvent {
  const ClearCart();
}

// ============================================
// SALES LIST EVENTS
// ============================================

abstract class SalesListEvent extends Equatable {
  const SalesListEvent();

  @override
  List<Object?> get props => [];
}

class LoadSales extends SalesListEvent {
  const LoadSales();
}

class RefreshSales extends SalesListEvent {
  const RefreshSales();
}

class SearchSales extends SalesListEvent {
  final String query;

  const SearchSales(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterSalesByDate extends SalesListEvent {
  final DateTime? dateFrom;
  final DateTime? dateTo;

  const FilterSalesByDate({
    this.dateFrom,
    this.dateTo,
  });

  @override
  List<Object?> get props => [dateFrom, dateTo];
}

class SortSales extends SalesListEvent {
  final String sortBy;
  final String order;

  const SortSales({
    required this.sortBy,
    required this.order,
  });

  @override
  List<Object?> get props => [sortBy, order];
}

// ============================================
// SALE DETAIL EVENTS
// ============================================

abstract class SaleDetailEvent extends Equatable {
  const SaleDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadSaleDetail extends SaleDetailEvent {
  final int saleId;

  const LoadSaleDetail(this.saleId);

  @override
  List<Object?> get props => [saleId];
}

class ResetSaleDetail extends SaleDetailEvent {
  const ResetSaleDetail();
}

class DownloadInvoice extends SaleDetailEvent {
  final int saleId;

  const DownloadInvoice(this.saleId);

  @override
  List<Object?> get props => [saleId];
}

class ShareInvoice extends SaleDetailEvent {
  final int saleId;

  const ShareInvoice(this.saleId);

  @override
  List<Object?> get props => [saleId];
}

// ============================================
// SALES STATISTICS EVENTS
// ============================================

abstract class SalesStatisticsEvent extends Equatable {
  const SalesStatisticsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSalesStatistics extends SalesStatisticsEvent {
  const LoadSalesStatistics();
}
