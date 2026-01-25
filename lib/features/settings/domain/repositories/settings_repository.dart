import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/app_preferences_entity.dart';

/// Abstract repository for settings operations
abstract class SettingsRepository {
  /// Get app preferences
  Future<Either<Failure, AppPreferencesEntity>> getPreferences();

  /// Update theme mode
  Future<Either<Failure, void>> updateThemeMode(ThemeMode themeMode);

  /// Update locale
  Future<Either<Failure, void>> updateLocale(Locale locale);

  /// Update currency format
  Future<Either<Failure, void>> updateCurrencyFormat(String currencyFormat);
}
