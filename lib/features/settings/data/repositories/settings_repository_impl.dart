import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../../../core/shared/app_navigator_key.dart';
import '../../../../core/storage/app_storage_service.dart';
import '../../../../core/theme/theme_manager.dart';
import '../../../../core/di/app_dependencies.dart';
import '../../domain/entities/app_preferences_entity.dart';
import '../../domain/repositories/settings_repository.dart';

/// Implementation of SettingsRepository
class SettingsRepositoryImpl implements SettingsRepository {
  final AppStorageService storageService;

  SettingsRepositoryImpl({
    required this.storageService,
  });

  @override
  Future<Either<Failure, AppPreferencesEntity>> getPreferences() async {
    try {
      final themeMode = await storageService.getThemeMode() ?? ThemeMode.system;
      // Get current locale from EasyLocalization using navigator key
      final context = appNavigatorKey.currentContext;
      final currentLocale = context != null 
          ? (EasyLocalization.of(context)?.locale ?? const Locale('ar'))
          : const Locale('ar');
      final currencyFormat = 'USD'; // Default, can be extended later

      return Right(AppPreferencesEntity(
        themeMode: themeMode,
        locale: currentLocale,
        currencyFormat: currencyFormat,
      ));
    } catch (e) {
      return Left(
        ServerFailure('Failed to get preferences: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateThemeMode(ThemeMode themeMode) async {
    try {
      // Use ThemeManager to update theme (this will automatically save and notify listeners)
      final themeManager = getIt<ThemeManager>();
      await themeManager.setThemeMode(themeMode);
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure('Failed to update theme mode: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateLocale(Locale locale) async {
    try {
      // Update EasyLocalization locale using navigator key
      final context = appNavigatorKey.currentContext;
      if (context != null) {
        // Set locale - this will trigger a rebuild of the entire widget tree
        await context.setLocale(locale);
        
        // Force rebuild by waiting a frame
        await Future.delayed(const Duration(milliseconds: 100));
      } else {
        return Left(
          ServerFailure('Context not available for locale update'),
        );
      }
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure('Failed to update locale: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateCurrencyFormat(String currencyFormat) async {
    try {
      // TODO: Store currency format in storage if needed
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure('Failed to update currency format: ${e.toString()}'),
      );
    }
  }
}
