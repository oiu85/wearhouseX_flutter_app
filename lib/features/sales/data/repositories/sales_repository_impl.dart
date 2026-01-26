import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../../stock/data/models/stock_models.dart';
import '../../../stock/domain/entities/stock_item_entity.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../../domain/entities/sale_statistics_entity.dart';
import '../../domain/repositories/sales_repository.dart';
import '../datasources/sales_remote_datasource.dart';
import '../models/sales_models.dart';

/// Implementation of SalesRepository
class SalesRepositoryImpl implements SalesRepository {
  final SalesRemoteDataSource remoteDataSource;

  SalesRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, SaleEntity>> createSale({
    required String customerName,
    required List<SaleItemEntity> items,
  }) async {
    final requestItems = items.map((item) => CreateSaleItemRequestModel(
      productId: item.productId,
      quantity: item.quantity,
      customPrice: item.customPrice,
    )).toList();

    final result = await remoteDataSource.createSale(
      customerName: customerName,
      items: requestItems,
    );

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (sale) {
        try {
          return Right(sale.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert sale: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<SaleEntity>>> getSales({
    String? search,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  }) async {
    final result = await remoteDataSource.getSales(
      search: search,
      dateFrom: dateFrom,
      dateTo: dateTo,
      sort: sort,
      order: order,
      perPage: perPage,
      page: page,
    );

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (responseData) {
        try {
          final data = responseData['data'] as List<dynamic>;
          final sales = data
              .map((json) => SaleModel.fromJson(json as Map<String, dynamic>))
              .toList();
          final entities = sales.map((model) => model.toEntity()).toList();
          return Right(entities);
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert sales: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, SaleEntity>> getSaleDetail(int saleId) async {
    final result = await remoteDataSource.getSaleDetail(saleId);

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (sale) {
        try {
          return Right(sale.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert sale detail: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, SaleStatisticsEntity>> getSalesStatistics() async {
    final result = await remoteDataSource.getSalesStatistics();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (statistics) {
        try {
          return Right(statistics.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert sales statistics: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<int>>> getInvoicePdf(int saleId) async {
    final result = await remoteDataSource.getInvoicePdf(saleId);

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (bytes) => Right(bytes),
    );
  }

  @override
  Future<Either<Failure, List<StockItemEntity>>> getAllDriverStock() async {
    final result = await remoteDataSource.getAllDriverStock();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (responseData) {
        try {
          final data = responseData['data'] as List<dynamic>;
          final stockItems = data
              .map((json) => StockItemModel.fromJson(json as Map<String, dynamic>))
              .toList();
          final entities = stockItems.map((model) => model.toEntity()).toList();
          return Right(entities);
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert stock items: ${e.toString()}'),
          );
        }
      },
    );
  }
}
