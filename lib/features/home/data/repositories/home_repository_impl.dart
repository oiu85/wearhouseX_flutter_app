import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/stock_item_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';
import '../models/home_models.dart';

/// Implementation of HomeRepository
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<StockItemEntity>>> getDriverStock() async {
    final result = await remoteDataSource.getDriverStock();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (stockItems) {
        try {
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
