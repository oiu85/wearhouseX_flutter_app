
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../auth/guest_mode_guard.dart';
import '../di/app_dependencies.dart';
import '../shared/app_navigator_key.dart';
import '../storage/app_storage_service.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/forget_password_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/stock_detail_page.dart';
import 'app_routes.dart';
import 'navigation_observer.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRoutes.login,
    observers: [
      AppRouteObserver(getIt<NavigationStateNotifier>()),
    ],
    redirect: (context, state) async {
      final storageService = getIt<AppStorageService>();
      final guestModeGuard = getIt<GuestModeGuard>();
      final loc = state.matchedLocation;
      
      // On web, skip splash/onboarding and go straight to home
      if (kIsWeb) {
        if (loc == AppRoutes.splash || loc.startsWith('/onboarding')) {
          return AppRoutes.home;
        }
        return null;
      }
      
      // Always allow splash screen to show (it handles navigation internally)
      // If user tries to access splash, let it show
      if (loc == AppRoutes.splash) {
        return null; // Allow splash to show
      }
      
      // Check if user is authenticated
      final isUserLoggedIn = await guestModeGuard.isUserLoggedIn();
      
      // If user is authenticated and tries to access login/signup/forgotPassword, redirect to home
      if (isUserLoggedIn) {
        if (loc == AppRoutes.login || 
            loc == AppRoutes.signup || 
            loc == AppRoutes.forgotPassword) {
          return AppRoutes.home;
        }
        // If authenticated, prevent access to onboarding pages
        if (loc.startsWith('/onboarding')) {
          return AppRoutes.home;
        }
        return null;
      }
      
      // User is not authenticated - check onboarding status
      final isOnboardingSkipped = await storageService.isOnboardingSkipped();
      
      // If onboarding was skipped but user is not logged in, prevent access to onboarding pages
      // Allow auth pages (login, signup, etc.) to be accessible
      if (isOnboardingSkipped) {
        if (loc.startsWith('/onboarding')) {
          // If user tries to access onboarding but it's skipped and they're not logged in, go to login
          return AppRoutes.login;
        }
        return null;
      }
      
      return null;
    },
    routes: [
      // Splash route (root)
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) {
          // For now, redirect to login if not authenticated
          // You can create a proper splash page later
          return const LoginPage();
        },
      ),
      // Auth routes
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgetPasswordPage(),
      ),
      // Home route
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      // Stock detail route
      GoRoute(
        path: AppRoutes.stockDetail,
        name: 'stockDetail',
        builder: (context, state) {
          final stockItemId = int.parse(state.pathParameters['id']!);
          return StockDetailPage(stockItemId: stockItemId);
        },
      ),
    ],
  );
}

