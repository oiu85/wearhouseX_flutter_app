import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/sale_entity.dart';
import '../entities/sale_item_entity.dart';
import '../entities/sale_statistics_entity.dart';

/// Abstract repository for sales operations
abstract class SalesRepository {
  /// Create a new sale
  Future<Either<Failure, SaleEntity>> createSale({
    required String customerName,
    required List<SaleItemEntity> items,
  });

  /// Get list of sales with optional filters
  Future<Either<Failure, List<SaleEntity>>> getSales({
    String? search,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  });

  /// Get sale detail by ID
  Future<Either<Failure, SaleEntity>> getSaleDetail(int saleId);

  /// Get sales statistics
  Future<Either<Failure, SaleStatisticsEntity>> getSalesStatistics();

  /// Get invoice PDF as bytes
  Future<Either<Failure, List<int>>> getInvoicePdf(int saleId);
}
