import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Storage keys for SharedPreferences
class StorageKeys {
  StorageKeys._();
  
  static const String splashCompleted = 'splash_completed';
  static const String onboardingSkipped = 'onboarding_skipped';
  static const String isGuestMode = 'is_guest_mode';
  static const String accessToken = 'access_token';
  static const String returnPath = 'return_path';
  static const String userName = 'user_name';
  static const String metalsPrices = 'metals_prices';
  static const String metalsPricesTimestamp = 'metals_prices_timestamp';
  static const String themeMode = 'theme_mode';
}

abstract class AppStorageService {
  /// Check if splash screen has been completed
  Future<bool> isSplashCompleted();
  
  /// Mark splash screen as completed
  Future<void> setSplashCompleted(bool value);
  
  /// Check if onboarding was skipped
  Future<bool> isOnboardingSkipped();
  
  /// Mark onboarding as skipped
  Future<void> setOnboardingSkipped(bool value);
  
  /// Check if user is in guest mode
  Future<bool> isGuestMode();
  
  /// Set guest mode status
  Future<void> setGuestMode(bool value);
  
  /// Get access token
  Future<String?> getAccessToken();
  
  /// Save access token
  Future<void> setAccessToken(String? token);
  
  /// Get return path (where to navigate after login)
  Future<String?> getReturnPath();
  
  /// Set return path (where to navigate after login)
  Future<void> setReturnPath(String? path);
  
  /// Clear return path
  Future<void> clearReturnPath();
  
  /// Get user name
  Future<String?> getUserName();
  
  /// Save user name
  Future<void> setUserName(String? name);
  
  /// Clear all stored data
  Future<void> clearAll();

  /// Get metals prices (gold and silver) with expiration check
  /// Returns null if expired (12 hours) or not found
  Future<Map<String, double>?> getMetalsPrices();

  /// Save metals prices with timestamp
  Future<void> setMetalsPrices({
    required double goldPricePerGram,
    required double silverPricePerGram,
  });

  /// Clear expired metals prices (removes only metals prices keys)
  Future<void> clearExpiredMetalsPrices();
  
  /// Clear all metals prices (for debugging/fixing corrupted cache)
  Future<void> clearMetalsPrices();

  /// Get saved theme mode
  Future<ThemeMode?> getThemeMode();

  /// Save theme mode
  Future<void> saveThemeMode(ThemeMode mode);
}

/// SharedPreferences implementation of AppStorageService
class SharedPreferencesStorageService implements AppStorageService {
  final SharedPreferences _prefs;
  
  SharedPreferencesStorageService(this._prefs);
  
  @override
  Future<bool> isSplashCompleted() async {
    return _prefs.getBool(StorageKeys.splashCompleted) ?? false;
  }
  
  @override
  Future<void> setSplashCompleted(bool value) async {
    await _prefs.setBool(StorageKeys.splashCompleted, value);
  }
  
  @override
  Future<bool> isOnboardingSkipped() async {
    return _prefs.getBool(StorageKeys.onboardingSkipped) ?? false;
  }
  
  @override
  Future<void> setOnboardingSkipped(bool value) async {
    await _prefs.setBool(StorageKeys.onboardingSkipped, value);
  }
  
  @override
  Future<bool> isGuestMode() async {
    // Default to true (guest mode) if key doesn't exist
    // This means new users are in guest mode by default
    return _prefs.getBool(StorageKeys.isGuestMode) ?? true;
  }
  
  @override
  Future<void> setGuestMode(bool value) async {
    await _prefs.setBool(StorageKeys.isGuestMode, value);
  }
  
  @override
  Future<String?> getAccessToken() async {
    return _prefs.getString(StorageKeys.accessToken);
  }
  
  @override
  Future<void> setAccessToken(String? token) async {
    if (token == null || token.isEmpty) {
      await _prefs.remove(StorageKeys.accessToken);
    } else {
      await _prefs.setString(StorageKeys.accessToken, token);
    }
  }
  
  @override
  Future<String?> getReturnPath() async {
    return _prefs.getString(StorageKeys.returnPath);
  }
  
  @override
  Future<void> setReturnPath(String? path) async {
    if (path == null || path.isEmpty) {
      await _prefs.remove(StorageKeys.returnPath);
    } else {
      await _prefs.setString(StorageKeys.returnPath, path);
    }
  }
  
  @override
  Future<void> clearReturnPath() async {
    await _prefs.remove(StorageKeys.returnPath);
  }
  
  @override
  Future<String?> getUserName() async {
    return _prefs.getString(StorageKeys.userName);
  }
  
  @override
  Future<void> setUserName(String? name) async {
    if (name == null || name.isEmpty) {
      await _prefs.remove(StorageKeys.userName);
    } else {
      await _prefs.setString(StorageKeys.userName, name);
    }
  }
  
  @override
  Future<void> clearAll() async {
    await _prefs.clear();
  }

  @override
  Future<Map<String, double>?> getMetalsPrices() async {
    // Check if prices exist
    final goldPrice = _prefs.getDouble('${StorageKeys.metalsPrices}_gold');
    final silverPrice = _prefs.getDouble('${StorageKeys.metalsPrices}_silver');
    final timestampStr = _prefs.getString(StorageKeys.metalsPricesTimestamp);

    if (goldPrice == null || silverPrice == null || timestampStr == null) {
      return null;
    }

    // Check if expired (12 hours) - automatically clear if expired
    try {
      final timestamp = DateTime.parse(timestampStr);
      final now = DateTime.now();
      final difference = now.difference(timestamp);

      // If 12 hours or more have passed, automatically clear expired cache
      if (difference.inHours >= 12) {
        // Automatically remove expired cache (12 hours passed)
        await clearExpiredMetalsPrices();
        if (kDebugMode) {
          debugPrint('=== AppStorageService: Cache expired (${difference.inHours} hours old), automatically cleared ===');
        }
        return null;
      }
      
      if (kDebugMode) {
        final hoursRemaining = 12 - difference.inHours;
        debugPrint('=== AppStorageService: Cache valid (${hoursRemaining.toStringAsFixed(1)} hours remaining) ===');
      }

      return {
        'gold': goldPrice,
        'silver': silverPrice,
      };
    } catch (e) {
      // Invalid timestamp, clear and return null
      await clearExpiredMetalsPrices();
      return null;
    }
  }

  @override
  Future<void> setMetalsPrices({
    required double goldPricePerGram,
    required double silverPricePerGram,
  }) async {
    await _prefs.setDouble('${StorageKeys.metalsPrices}_gold', goldPricePerGram);
    await _prefs.setDouble('${StorageKeys.metalsPrices}_silver', silverPricePerGram);
    await _prefs.setString(
      StorageKeys.metalsPricesTimestamp,
      DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<void> clearExpiredMetalsPrices() async {
    // Remove only metals prices related keys
    await _prefs.remove('${StorageKeys.metalsPrices}_gold');
    await _prefs.remove('${StorageKeys.metalsPrices}_silver');
    await _prefs.remove(StorageKeys.metalsPricesTimestamp);
  }

  @override
  Future<void> clearMetalsPrices() async {
    // Clear all metals prices (same as clearExpiredMetalsPrices)
    await clearExpiredMetalsPrices();
  }

  @override
  Future<ThemeMode?> getThemeMode() async {
    final modeString = _prefs.getString(StorageKeys.themeMode);
    if (modeString == null) return null;
    
    switch (modeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    String modeString;
    switch (mode) {
      case ThemeMode.light:
        modeString = 'light';
        break;
      case ThemeMode.dark:
        modeString = 'dark';
        break;
      case ThemeMode.system:
        modeString = 'system';
        break;
    }
    await _prefs.setString(StorageKeys.themeMode, modeString);
  }
}

