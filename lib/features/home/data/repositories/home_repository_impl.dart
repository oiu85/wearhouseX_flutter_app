import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/driver_stats_entity.dart';
import '../../domain/entities/sale_entity.dart';
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
  Future<Either<Failure, DriverStatsEntity>> getDriverStats() async {
    final result = await remoteDataSource.getDriverStats();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (statsModel) {
        try {
          return Right(statsModel.toEntity());
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert driver stats: ${e.toString()}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<SaleEntity>>> getRecentSales({int limit = 10}) async {
    //* Get stats which includes recent sales
    final result = await remoteDataSource.getDriverStats();

    return result.fold(
      (networkFailure) => Left(
        NetworkFailure(networkFailure.message),
      ),
      (statsModel) {
        try {
          final sales = statsModel.recentSales
              .take(limit)
              .map((model) => model.toEntity())
              .toList();
          return Right(sales);
        } catch (e) {
          return Left(
            ServerFailure('Failed to convert recent sales: ${e.toString()}'),
          );
        }
      },
    );
  }
}
