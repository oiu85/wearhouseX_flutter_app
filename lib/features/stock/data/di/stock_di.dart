import 'package:get_it/get_it.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../datasources/stock_remote_datasource.dart';
import '../repositories/stock_repository_impl.dart';
import '../../domain/repositories/stock_repository.dart';
import '../../presentation/bloc/stock_bloc.dart';
import '../../presentation/bloc/stock_detail_bloc.dart';

/// Register all stock feature dependencies
void registerStockDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<StockRemoteDataSource>(
    () => StockRemoteDataSourceImpl(
      getIt<NetworkClient>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      remoteDataSource: getIt<StockRemoteDataSource>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<StockBloc>(
    () => StockBloc(
      repository: getIt<StockRepository>(),
      storageService: getIt<AppStorageService>(),
    ),
  );

  getIt.registerFactory<StockDetailBloc>(
    () => StockDetailBloc(
      repository: getIt<StockRepository>(),
    ),
  );
}
