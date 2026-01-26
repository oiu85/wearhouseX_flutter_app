import 'package:get_it/get_it.dart';
import '../../../../core/network/network_client.dart';
import '../../domain/repositories/stock_request_repository.dart';
import '../datasources/stock_request_remote_datasource.dart';
import '../repositories/stock_request_repository_impl.dart';
import '../../presentation/bloc/stock_request_bloc.dart';

/// Register all stock request feature dependencies
void registerStockRequestDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<StockRequestRemoteDataSource>(
    () => StockRequestRemoteDataSourceImpl(
      getIt<NetworkClient>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<StockRequestRepository>(
    () => StockRequestRepositoryImpl(
      getIt<StockRequestRemoteDataSource>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<StockRequestBloc>(
    () => StockRequestBloc(
      repository: getIt<StockRequestRepository>(),
    ),
  );
}
