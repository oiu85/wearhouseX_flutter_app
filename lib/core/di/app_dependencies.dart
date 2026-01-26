import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/di/home_di.dart';
import '../../features/notifications/data/di/notifications_di.dart';
import '../../features/settings/data/di/settings_di.dart';
import '../../features/stock_request/data/di/stock_request_di.dart';
import '../routing/navigation_observer.dart';
import '../storage/app_storage_service.dart';
import '../network/network_client.dart';
import '../auth/guest_mode_guard.dart';
import '../services/fcm_service.dart';
import '../../features/auth/di/auth_di.dart';
import '../../features/stock/data/di/stock_di.dart';
import '../../features/sales/data/di/sales_di.dart';
import '../../features/profile/data/di/profile_di.dart';
import '../../features/menu/data/di/menu_di.dart';

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

  // Register FCM Service (@singleton)
  getIt.registerSingleton<FcmService>(
    FcmService(),
  );

  // Register Auth feature dependencies
  registerAuthDependencies(getIt);

  // Register Stock feature dependencies
  registerStockDependencies(getIt);

  // Register Home feature dependencies
  registerHomeDependencies(getIt);

  // Register Sales feature dependencies
  registerSalesDependencies(getIt);

  // Register Profile feature dependencies
  registerProfileDependencies(getIt);

  // Register Settings feature dependencies
  registerSettingsDependencies(getIt);

  // Register Menu feature dependencies
  registerMenuDependencies(getIt);

  // Register Notifications feature dependencies
  registerNotificationsDependencies(getIt);

  // Register Stock Request feature dependencies
  registerStockRequestDependencies(getIt);

  return getIt;
}
