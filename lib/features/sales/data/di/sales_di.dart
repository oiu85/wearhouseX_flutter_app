import 'package:get_it/get_it.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/repositories/sales_repository.dart';
import '../datasources/cart_local_datasource.dart';
import '../datasources/sales_remote_datasource.dart';
import '../repositories/sales_repository_impl.dart';
import '../../presentation/bloc/sales_bloc.dart';

/// Register all sales feature dependencies
void registerSalesDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<SalesRemoteDataSource>(
    () => SalesRemoteDataSourceImpl(
      getIt<NetworkClient>(),
    ),
  );

  getIt.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(
      getIt<AppStorageService>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<SalesRepository>(
    () => SalesRepositoryImpl(
      remoteDataSource: getIt<SalesRemoteDataSource>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<CreateSaleBloc>(
    () => CreateSaleBloc(
      repository: getIt<SalesRepository>(),
      cartLocalDataSource: getIt<CartLocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<SalesListBloc>(
    () => SalesListBloc(
      repository: getIt<SalesRepository>(),
    ),
  );

  getIt.registerLazySingleton<SaleDetailBloc>(
    () => SaleDetailBloc(
      repository: getIt<SalesRepository>(),
    ),
  );

  getIt.registerLazySingleton<SalesStatisticsBloc>(
    () => SalesStatisticsBloc(
      repository: getIt<SalesRepository>(),
    ),
  );
}
