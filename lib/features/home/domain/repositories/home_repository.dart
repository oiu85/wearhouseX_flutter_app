import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/driver_stats_entity.dart';
import '../entities/sale_entity.dart';
import '../entities/dashboard_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, DriverStatsEntity>> getDriverStats();
  Future<Either<Failure, List<SaleEntity>>> getRecentSales({int limit = 10});
  Future<Either<Failure, DashboardEntity>> getDashboard();
}
