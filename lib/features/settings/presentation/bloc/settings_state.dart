import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/status/bloc_status.dart';
import '../../domain/entities/app_preferences_entity.dart';

/// Settings state
class SettingsState extends Equatable {
  final BlocStatus status;
  final AppPreferencesEntity? preferences;
  final String? errorMessage;

  const SettingsState({
    required this.status,
    this.preferences,
    this.errorMessage,
  });

  factory SettingsState.initial() => const SettingsState(
        status: BlocStatus.initial(),
        preferences: null,
        errorMessage: null,
      );

  SettingsState copyWith({
    BlocStatus? status,
    AppPreferencesEntity? preferences,
    String? errorMessage,
  }) {
    return SettingsState(
      status: status ?? this.status,
      preferences: preferences ?? this.preferences,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, preferences, errorMessage];
}
