import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/stock_request_entity.dart';

/// Abstract repository for stock requests
abstract class StockRequestRepository {
  /// Create a stock request
  Future<Either<Failure, StockRequestEntity>> createRequest({
    required int productId,
    required int quantity,
  });

  /// Get all stock requests for the current driver
  Future<Either<Failure, List<StockRequestEntity>>> getRequests();

  /// Get a specific stock request
  Future<Either<Failure, StockRequestEntity>> getRequest(int id);
}
