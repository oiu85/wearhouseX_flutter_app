import 'package:get_it/get_it.dart';
import '../../../../core/network/network_client.dart';
import '../datasources/home_remote_datasource.dart';
import '../repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../presentation/bloc/home_bloc.dart';

/// Register all home feature dependencies
void registerHomeDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      getIt<NetworkClient>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      repository: getIt<HomeRepository>(),
    ),
  );
}
