import 'package:get_it/get_it.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../presentation/bloc/menu_bloc.dart';

/// Register all menu feature dependencies
void registerMenuDependencies(GetIt getIt) {
  // BLoCs
  getIt.registerLazySingleton<MenuBloc>(
    () => MenuBloc(
      storageService: getIt<AppStorageService>(),
    ),
  );
}
