import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_local_datasource.dart';
import '../repositories/notifications_repository_impl.dart';
import '../../presentation/bloc/notifications_bloc.dart';

/// Register all notifications feature dependencies
void registerNotificationsDependencies(GetIt getIt) {
  // Data Sources
  getIt.registerLazySingleton<NotificationsLocalDataSource>(
    () => NotificationsLocalDataSource(
      getIt<SharedPreferences>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(
      getIt<NotificationsLocalDataSource>(),
    ),
  );

  // BLoCs
  getIt.registerLazySingleton<NotificationsBloc>(
    () => NotificationsBloc(
      repository: getIt<NotificationsRepository>(),
    ),
  );
}
