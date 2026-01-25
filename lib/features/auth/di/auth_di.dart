import 'package:get_it/get_it.dart';
import '../../../core/network/network_client.dart';
import '../../../core/storage/app_storage_service.dart';
import '../data/datasources/auth_remote_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/bloc/auth_bloc.dart';

/// Register all auth feature dependencies
void registerAuthDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      getIt<NetworkClient>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      storageService: getIt<AppStorageService>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<LoginBloc>(
    () => LoginBloc(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<ResetPasswordBloc>(
    () => ResetPasswordBloc(
      repository: getIt<AuthRepository>(),
    ),
  );
}
