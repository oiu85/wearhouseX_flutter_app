import 'package:equatable/equatable.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../../domain/entities/sale_statistics_entity.dart';

// ============================================
// CREATE SALE STATE
// ============================================

class CreateSaleState extends Equatable {
  final BlocStatus status;
  final String customerName;
  final List<CartItem> cartItems;
  final SaleEntity? createdSale;
  final String? errorMessage;
  final Set<int> selectedProductIds;
  final bool isMultiSelectExpanded;
  final List<StockItemEntity> allProducts;
  final List<StockItemEntity> filteredProducts;
  final String productSearchQuery;
  final BlocStatus productsStatus;

  const CreateSaleState({
    required this.status,
    required this.customerName,
    required this.cartItems,
    this.createdSale,
    this.errorMessage,
    required this.selectedProductIds,
    required this.isMultiSelectExpanded,
    required this.allProducts,
    required this.filteredProducts,
    required this.productSearchQuery,
    required this.productsStatus,
  });

  factory CreateSaleState.initial() => const CreateSaleState(
        status: BlocStatus.initial(),
        customerName: '',
        cartItems: [],
        createdSale: null,
        errorMessage: null,
        selectedProductIds: {},
        isMultiSelectExpanded: false,
        allProducts: [],
        filteredProducts: [],
        productSearchQuery: '',
        productsStatus: BlocStatus.initial(),
      );

  CreateSaleState copyWith({
    BlocStatus? status,
    String? customerName,
    List<CartItem>? cartItems,
    SaleEntity? createdSale,
    String? errorMessage,
    Set<int>? selectedProductIds,
    bool? isMultiSelectExpanded,
    List<StockItemEntity>? allProducts,
    List<StockItemEntity>? filteredProducts,
    String? productSearchQuery,
    BlocStatus? productsStatus,
  }) {
    return CreateSaleState(
      status: status ?? this.status,
      customerName: customerName ?? this.customerName,
      cartItems: cartItems ?? this.cartItems,
      createdSale: createdSale ?? this.createdSale,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedProductIds: selectedProductIds ?? this.selectedProductIds,
      isMultiSelectExpanded: isMultiSelectExpanded ?? this.isMultiSelectExpanded,
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      productSearchQuery: productSearchQuery ?? this.productSearchQuery,
      productsStatus: productsStatus ?? this.productsStatus,
    );
  }

  double get totalAmount {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + item.subtotal,
    );
  }

  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  List<Object?> get props => [
        status,
        customerName,
        cartItems,
        createdSale,
        errorMessage,
        selectedProductIds,
        isMultiSelectExpanded,
        allProducts,
        filteredProducts,
        productSearchQuery,
        productsStatus,
      ];
}

/// Cart item model for create sale
class CartItem extends Equatable {
  final int productId;
  final String productName;
  final double price;
  final int quantity;
  final int availableQuantity;
  final double? customPrice;
  final double? pricePercentage;

  const CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.availableQuantity,
    this.customPrice,
    this.pricePercentage,
  });

  double get effectivePrice => customPrice ?? price;
  double get subtotal => effectivePrice * quantity;

  CartItem copyWith({
    int? quantity,
    double? customPrice,
    double? pricePercentage,
  }) {
    return CartItem(
      productId: productId,
      productName: productName,
      price: price,
      quantity: quantity ?? this.quantity,
      availableQuantity: availableQuantity,
      customPrice: customPrice ?? this.customPrice,
      pricePercentage: pricePercentage ?? this.pricePercentage,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        productName,
        price,
        quantity,
        availableQuantity,
        customPrice,
        pricePercentage,
      ];
}

// ============================================
// SALES LIST STATE
// ============================================

class SalesListState extends Equatable {
  final BlocStatus status;
  final List<SaleEntity> sales;
  final List<SaleEntity> filteredSales;
  final String searchQuery;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final String sortBy;
  final String sortOrder;
  final String? errorMessage;

  const SalesListState({
    required this.status,
    required this.sales,
    required this.filteredSales,
    required this.searchQuery,
    this.dateFrom,
    this.dateTo,
    required this.sortBy,
    required this.sortOrder,
    this.errorMessage,
  });

  factory SalesListState.initial() => const SalesListState(
        status: BlocStatus.initial(),
        sales: [],
        filteredSales: [],
        searchQuery: '',
        dateFrom: null,
        dateTo: null,
        sortBy: 'date',
        sortOrder: 'desc',
        errorMessage: null,
      );

  SalesListState copyWith({
    BlocStatus? status,
    List<SaleEntity>? sales,
    List<SaleEntity>? filteredSales,
    String? searchQuery,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? sortBy,
    String? sortOrder,
    String? errorMessage,
  }) {
    return SalesListState(
      status: status ?? this.status,
      sales: sales ?? this.sales,
      filteredSales: filteredSales ?? this.filteredSales,
      searchQuery: searchQuery ?? this.searchQuery,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        sales,
        filteredSales,
        searchQuery,
        dateFrom,
        dateTo,
        sortBy,
        sortOrder,
        errorMessage,
      ];
}

// ============================================
// SALE DETAIL STATE
// ============================================

class SaleDetailState extends Equatable {
  final BlocStatus status;
  final SaleEntity? sale;
  final String? errorMessage;
  final bool isDownloadingInvoice;
  final bool isSharingInvoice;

  const SaleDetailState({
    required this.status,
    this.sale,
    this.errorMessage,
    this.isDownloadingInvoice = false,
    this.isSharingInvoice = false,
  });

  factory SaleDetailState.initial() => const SaleDetailState(
        status: BlocStatus.initial(),
        sale: null,
        errorMessage: null,
        isDownloadingInvoice: false,
        isSharingInvoice: false,
      );

  SaleDetailState copyWith({
    BlocStatus? status,
    SaleEntity? sale,
    String? errorMessage,
    bool? isDownloadingInvoice,
    bool? isSharingInvoice,
  }) {
    return SaleDetailState(
      status: status ?? this.status,
      sale: sale ?? this.sale,
      errorMessage: errorMessage ?? this.errorMessage,
      isDownloadingInvoice: isDownloadingInvoice ?? this.isDownloadingInvoice,
      isSharingInvoice: isSharingInvoice ?? this.isSharingInvoice,
    );
  }

  @override
  List<Object?> get props => [status, sale, errorMessage, isDownloadingInvoice, isSharingInvoice];
}

// ============================================
// SALES STATISTICS STATE
// ============================================

class SalesStatisticsState extends Equatable {
  final BlocStatus status;
  final SaleStatisticsEntity? statistics;
  final String? errorMessage;

  const SalesStatisticsState({
    required this.status,
    this.statistics,
    this.errorMessage,
  });

  factory SalesStatisticsState.initial() => const SalesStatisticsState(
        status: BlocStatus.initial(),
        statistics: null,
        errorMessage: null,
      );

  SalesStatisticsState copyWith({
    BlocStatus? status,
    SaleStatisticsEntity? statistics,
    String? errorMessage,
  }) {
    return SalesStatisticsState(
      status: status ?? this.status,
      statistics: statistics ?? this.statistics,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, statistics, errorMessage];
}
