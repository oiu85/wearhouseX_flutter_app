import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_routes.dart';

/// A utility class for handling safe navigation operations.
/// 
/// This class provides methods to safely navigate back when the navigation
/// stack might be empty (e.g., after login redirect flow).
class SafeNavigation {
  SafeNavigation._();

  /// Safely navigates back to the previous page.
  /// 
  /// If there's a page to pop, it pops. Otherwise, it navigates to home.
  /// This prevents the "popped the last page off the stack" error.
  /// 
  /// Example:
  /// ```dart
  /// SafeNavigation.back(context);
  /// ```
  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      // No pages to pop, navigate to home
      context.go(AppRoutes.home);
    }
  }

  /// Safely navigates back with a custom fallback route.
  /// 
  /// If there's a page to pop, it pops. Otherwise, it navigates to the
  /// specified fallback route.
  /// 
  /// Example:
  /// ```dart
  /// SafeNavigation.backOrGo(context, '/custom-route');
  /// ```
  static void backOrGo(BuildContext context, String fallbackRoute) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      context.go(fallbackRoute);
    }
  }

  /// Safely navigates back with a result.
  /// 
  /// If there's a page to pop, it pops with the result. Otherwise, it 
  /// navigates to home (result is lost in this case).
  /// 
  /// Example:
  /// ```dart
  /// SafeNavigation.backWithResult(context, selectedItem);
  /// ```
  static void backWithResult<T>(BuildContext context, T result) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    } else {
      context.go(AppRoutes.home);
    }
  }

  /// Checks if we can safely pop the current route.
  /// 
  /// Returns true if there's at least one page in the stack to pop.
  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }

  /// Navigates to a return path after login, ensuring home is at the base
  /// of the navigation stack.
  /// 
  /// This method should be used after successful authentication when
  /// redirecting to a stored return path. It ensures the user can always
  /// navigate back to home.
  /// 
  /// Example:
  /// ```dart
  /// await SafeNavigation.navigateToReturnPath(context, '/my-donations');
  /// ```
  static Future<void> navigateToReturnPath(
    BuildContext context,
    String returnPath,
  ) async {
    // First go to home to establish base of navigation stack
    context.go(AppRoutes.home);
    
    // Small delay to ensure home is rendered before pushing
    await Future.delayed(const Duration(milliseconds: 100));
    
    if (context.mounted) {
      context.push(returnPath);
    }
  }

  /// Navigates to a return path with query parameters after login.
  /// 
  /// Handles special cases like home with tab index.
  /// 
  /// Example:
  /// ```dart
  /// await SafeNavigation.navigateToReturnPathWithParams(
  ///   context,
  ///   returnPath: '/home?tab=2',
  /// );
  /// ```
  static Future<void> navigateToReturnPathWithParams(
    BuildContext context, {
    required String returnPath,
  }) async {
    final uri = Uri.parse(returnPath);
    final path = uri.path;
    final tabIndex = uri.queryParameters['tab'];

    // Handle home with tab index specially
    if (path == AppRoutes.home && tabIndex != null) {
      final tab = int.tryParse(tabIndex) ?? 0;
      context.go(AppRoutes.home, extra: tab);
      return;
    }

    // For other paths, go to home first then push return path
    await navigateToReturnPath(context, returnPath);
  }
}

