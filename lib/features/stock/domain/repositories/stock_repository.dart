import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/stock_item_entity.dart';
import '../entities/stock_statistics_entity.dart';

abstract class StockRepository {
  Future<Either<Failure, List<StockItemEntity>>> getDriverStock({
    String? search,
    int? categoryId,
    String? sort,
    String? order,
    bool? lowStockOnly,
    int? perPage,
    int? page,
  });
  
  Future<Either<Failure, StockItemEntity>> getStockDetailByProductId(int productId);
  
  Future<Either<Failure, StockStatisticsEntity>> getStockStatistics({
    int? lowStockThreshold,
  });
  
  Future<Either<Failure, StockItemEntity>> getStockItemById(int stockItemId);
}
