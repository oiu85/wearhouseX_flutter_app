import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/stock_item_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<StockItemEntity>>> getDriverStock();
  Future<Either<Failure, StockItemEntity>> getStockItemById(int stockItemId);
}
