import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/shared/responsive.dart';
import 'core/theme/theme_transition.dart';
import 'core/theme/theme_manager.dart';
import 'core/di/app_dependencies.dart';
import 'core/storage/app_storage_service.dart';
import 'core/services/fcm_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //* Ensure the binding is initialized

  // Initialize Firebase FIRST (before dependency injection)
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialized successfully');
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
    // Continue app initialization even if Firebase fails
  }

  // Initialize dependency injection (must be awaited)
  await configureDependencies();

  // Initialize FCM service after DI is set up (non-blocking)
  // Don't await - let it initialize in the background
  getIt<FcmService>().initialize().catchError((error) {
    debugPrint('FCM service initialization failed: $error');
  });

  // Initialize Stripe SDK if needed (optional)
  // try {
    // Uncomment and configure with your Stripe keys if needed
    // Stripe.publishableKey = "your_publishable_key";
    // Stripe.merchantIdentifier = "merchant.com.zaker.app";
    // await Stripe.instance.applySettings();
  // } catch (e) {
  //   debugPrint('Stripe initialization skipped: $e');
  // }

  // Lock orientation to portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Enable edge-to-edge mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final isLight = brightness == Brightness.light;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false, // Disable Android's automatic scrim
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
    ),
  );

  await EasyLocalization.ensureInitialized();

  // Get theme mode from storage
  final storageService = getIt<AppStorageService>();
  final savedThemeMode = await storageService.getThemeMode();
  final themeMode = savedThemeMode ?? ThemeMode.system;

  runApp(
    EasyLocalization( //* Easy localization for the app
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation', //* Path to the translation files
      fallbackLocale: const Locale('ar'), //* Fallback locale
      startLocale: const Locale('ar'), //* Start locale
      useOnlyLangCode: true, //* Use only the language code
      child: MyApp(initialThemeMode: themeMode), //* My app
    ),
  );
}

class MyApp extends StatefulWidget {
  final ThemeMode initialThemeMode;

  const MyApp({
    super.key,
    required this.initialThemeMode,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();
    _themeManager = getIt<ThemeManager>();
    
    // Listen to theme changes from ThemeManager
    _themeManager.addListener(_onThemeChanged);
    
    // Listen to system theme changes
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      if (_themeManager.themeMode == ThemeMode.system) {
        setState(() {});
      }
    };
  }

  void _onThemeChanged() {
    // Rebuild the entire app when theme changes
    setState(() {});
  }

  @override
  void dispose() {
    _themeManager.removeListener(_onThemeChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = isDesktopLayout(constraints); //* Check if the device is a desktop
        return ScreenUtilInit(
          designSize: isDesktop ? const Size(1440, 1024) : const Size(390, 844), //* Design size for the device
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: MaterialApp.router(
                routerConfig: AppRouter.router,
                title: 'WeareHouse X', //* App name
                theme: appTheme(context), //* Light theme
                darkTheme: appDarkTheme(context), //* Dark theme
                themeMode: _themeManager.themeMode, //* Theme mode from ThemeManager
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates, //* Localizations delegates
                supportedLocales: context.supportedLocales, //* Supported locales
                locale: context.locale, //* Locale
                builder: (context, child) {
                  return ThemeTransition(
                    themeMode: _themeManager.themeMode, //* Theme mode from ThemeManager
                    child: child ?? const SizedBox(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
