import 'package:flutter/material.dart';

/// App preferences entity
class AppPreferencesEntity {
  final ThemeMode themeMode;
  final Locale locale;
  final String currencyFormat;

  const AppPreferencesEntity({
    required this.themeMode,
    required this.locale,
    required this.currencyFormat,
  });
}
