import 'package:get_it/get_it.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../repositories/profile_repository_impl.dart';
import '../../presentation/bloc/profile_bloc.dart';

/// Register all profile feature dependencies
void registerProfileDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      getIt<NetworkClient>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
      storageService: getIt<AppStorageService>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(
      repository: getIt<ProfileRepository>(),
    ),
  );
}
