import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routing/navigation_observer.dart';
import '../storage/app_storage_service.dart';
import '../network/network_client.dart';
import '../auth/guest_mode_guard.dart';
import '../../features/auth/di/auth_di.dart';
import '../../features/home/data/di/home_di.dart';

final getIt = GetIt.instance;

/// Configure and initialize all dependencies
/// This must be called after WidgetsFlutterBinding.ensureInitialized()
Future<GetIt> configureDependencies() async {
  // Initialize SharedPreferences first
  final prefs = await SharedPreferences.getInstance();
  
  // Register SharedPreferences manually
  getIt.registerSingleton<SharedPreferences>(prefs);
  
  // Register storage service
  getIt.registerLazySingleton<AppStorageService>(
    () => SharedPreferencesStorageService(getIt<SharedPreferences>()),
  );
  
  // Register GuestModeGuard
  getIt.registerLazySingleton<GuestModeGuard>(
    () => GuestModeGuard(getIt<AppStorageService>()),
  );
  
  // Register NavigationStateNotifier as singleton
  getIt.registerSingleton<NavigationStateNotifier>(
    NavigationStateNotifier(),
  );
  
  // Register NetworkClient (@singleton)
  getIt.registerSingleton<NetworkClient>(
    NetworkClient(getIt<AppStorageService>()),
  );

        // Register Auth feature dependencies
        registerAuthDependencies(getIt);

        // Register Home feature dependencies
        registerHomeDependencies(getIt);
  
  return getIt;
}
