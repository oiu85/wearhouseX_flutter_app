import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../models/home_models.dart';

/// Remote data source for home/stock API calls
abstract class HomeRemoteDataSource {
  /// Get driver's stock
  Future<Either<NetworkFailure, List<StockItemModel>>> getDriverStock();
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
}
