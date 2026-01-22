import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../models/home_models.dart';

/// Remote data source for home/stock API calls
abstract class HomeRemoteDataSource {
  /// Get driver's stock
  Future<Either<NetworkFailure, List<StockItemModel>>> getDriverStock();
  
  /// Get a single stock item by ID
  Future<Either<NetworkFailure, StockItemModel>> getStockItemById(int stockItemId);
}

/// Implementation of HomeRemoteDataSource
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkClient networkClient;

  HomeRemoteDataSourceImpl(this.networkClient);

  @override
  Future<Either<NetworkFailure, List<StockItemModel>>> getDriverStock() async {
    final result = await networkClient.get(ApiConfig.driverMyStock);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as List<dynamic>;
          final stockItems = data
              .map((json) => StockItemModel.fromJson(json as Map<String, dynamic>))
              .toList();
          return Right(stockItems);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse stock data: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, StockItemModel>> getStockItemById(int stockItemId) async {
    //* Get all stock items and find the one with matching ID
    final result = await getDriverStock();

    return result.fold(
      (failure) => Left(failure),
      (stockItems) {
        try {
          final stockItem = stockItems.firstWhere(
            (item) => item.id == stockItemId,
            orElse: () => throw Exception('Stock item not found'),
          );
          return Right(stockItem);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Stock item not found: ${e.toString()}',
            ),
          );
        }
      },
    );
  }
}
