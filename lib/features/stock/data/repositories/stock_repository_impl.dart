import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/stock_item_entity.dart';
import '../../domain/entities/stock_statistics_entity.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/stock_remote_datasource.dart';
import '../models/stock_models.dart';

/// Implementation of StockRepository
class StockRepositoryImpl implements StockRepository {
  final StockRemoteDataSource remoteDataSource;

  StockRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<StockItemEntity>>> getDriverStock({
    String? search,
    int? categoryId,
    String? sort,
    String? order,
    bool? lowStockOnly,
    int? perPage,
    int? page,
  }) async {
    final result = await remoteDataSource.getDriverStock(
      search: search,
      categoryId: categoryId,
      sort: sort,
      order: order,
      lowStockOnly: lowStockOnly,
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
          final stockItems = data
              .map((json) => StockItemResponseModel.fromJson(json as Map<String, dynamic>))
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

  @override
  Future<Either<Failure, StockItemEntity>> getStockDetailByProductId(
    int productId,
  ) async {
    final result = await remoteDataSource.getStockDetail(productId);

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (stockDetail) {
        try {
          // Convert StockDetailModel to StockItemEntity
          final stockItem = StockItemEntity(
            id: stockDetail.id,
            driverId: 0, // Not provided in detail response
            productId: stockDetail.product.id,
            quantity: stockDetail.quantity,
            product: stockDetail.product.toEntity(),
            updatedAt: stockDetail.lastUpdated != null
                ? DateTime.tryParse(stockDetail.lastUpdated!)
                : null,
          );
          return Right(stockItem);
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert stock detail: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, StockStatisticsEntity>> getStockStatistics({
    int? lowStockThreshold,
  }) async {
    final result = await remoteDataSource.getStockStatistics(
      lowStockThreshold: lowStockThreshold,
    );

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (statistics) {
        try {
          return Right(statistics.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert stock statistics: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, StockItemEntity>> getStockItemById(int stockItemId) async {
    final result = await remoteDataSource.getStockItemById(stockItemId);

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (stockItem) {
        try {
          return Right(stockItem.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert stock item: ${e.toString()}'),
          );
        }
      },
    );
  }
}
