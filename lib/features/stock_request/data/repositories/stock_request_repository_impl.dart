import 'package:injectable/injectable.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/repositories/stock_request_repository.dart';
import '../../domain/entities/stock_request_entity.dart';
import '../datasources/stock_request_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../models/stock_request_models.dart';

@Injectable(as: StockRequestRepository)
class StockRequestRepositoryImpl implements StockRequestRepository {
  final StockRequestRemoteDataSource _remoteDataSource;

  StockRequestRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, StockRequestEntity>> createRequest({
    required int productId,
    required int quantity,
  }) async {
    try {
      final model = await _remoteDataSource.createRequest(
        productId: productId,
        quantity: quantity,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(NetworkFailure('Failed to create stock request: $e'));
    }
  }

  @override
  Future<Either<Failure, List<StockRequestEntity>>> getRequests() async {
    try {
      final models = await _remoteDataSource.getRequests();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(NetworkFailure('Failed to get stock requests: $e'));
    }
  }

  @override
  Future<Either<Failure, StockRequestEntity>> getRequest(int id) async {
    try {
      final model = await _remoteDataSource.getRequest(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(NetworkFailure('Failed to get stock request: $e'));
    }
  }
}
