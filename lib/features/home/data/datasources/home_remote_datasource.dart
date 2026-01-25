import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../models/home_models.dart';

/// Remote data source for home/dashboard API calls
abstract class HomeRemoteDataSource {
  /// Get driver statistics
  Future<Either<NetworkFailure, DriverStatsModel>> getDriverStats();

  /// Get dashboard data
  Future<Either<NetworkFailure, DashboardModel>> getDashboard();
}

/// Implementation of HomeRemoteDataSource
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkClient networkClient;

  HomeRemoteDataSourceImpl(this.networkClient);

  @override
  Future<Either<NetworkFailure, DriverStatsModel>> getDriverStats() async {
    final result = await networkClient.get(ApiConfig.driverStats);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final stats = DriverStatsModel.fromJson(data);
          return Right(stats);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse driver stats: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, DashboardModel>> getDashboard() async {
    final result = await networkClient.get(ApiConfig.dashboard);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final dashboardData = data['data'] as Map<String, dynamic>;
          final dashboard = DashboardModel.fromJson(dashboardData);
          return Right(dashboard);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse dashboard data: ${e.toString()}',
            ),
          );
        }
      },
    );
  }
}
