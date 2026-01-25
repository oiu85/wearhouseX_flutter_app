import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Settings events
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

/// Load preferences
class LoadPreferences extends SettingsEvent {
  const LoadPreferences();
}

/// Update theme mode
class UpdateThemeMode extends SettingsEvent {
  final ThemeMode themeMode;

  const UpdateThemeMode(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

/// Update locale
class UpdateLocale extends SettingsEvent {
  final Locale locale;

  const UpdateLocale(this.locale);

  @override
  List<Object?> get props => [locale];
}

/// Update currency format
class UpdateCurrencyFormat extends SettingsEvent {
  final String currencyFormat;

  const UpdateCurrencyFormat(this.currencyFormat);

  @override
  List<Object?> get props => [currencyFormat];
}

/// Reset settings
class ResetSettings extends SettingsEvent {
  const ResetSettings();
}
