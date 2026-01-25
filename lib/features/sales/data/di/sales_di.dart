import 'package:get_it/get_it.dart';
import '../../../../core/network/network_client.dart';
import '../../domain/repositories/sales_repository.dart';
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
