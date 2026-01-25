import 'package:get_it/get_it.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../domain/repositories/settings_repository.dart';
import '../repositories/settings_repository_impl.dart';
import '../../presentation/bloc/settings_bloc.dart';

/// Register all settings feature dependencies
void registerSettingsDependencies(GetIt getIt) {
  // Repositories
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      storageService: getIt<AppStorageService>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<SettingsBloc>(
    () => SettingsBloc(
      repository: getIt<SettingsRepository>(),
    ),
  );
}
