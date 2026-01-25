import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/app_preferences_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import 'settings_event.dart';
import 'settings_state.dart';

/// Settings BLoC
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository repository;

  SettingsBloc({
    required this.repository,
  }) : super(SettingsState.initial()) {
    on<LoadPreferences>(_onLoadPreferences);
    on<UpdateThemeMode>(_onUpdateThemeMode);
    on<UpdateLocale>(_onUpdateLocale);
    on<UpdateCurrencyFormat>(_onUpdateCurrencyFormat);
    on<ResetSettings>(_onResetSettings);
  }

  Future<void> _onLoadPreferences(
    LoadPreferences event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    final result = await repository.getPreferences();

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BlocStatus.fail(error: failure.message),
          errorMessage: failure.message,
        ));
      },
      (preferences) {
        emit(state.copyWith(
          status: const BlocStatus.success(),
          preferences: preferences,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onUpdateThemeMode(
    UpdateThemeMode event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await repository.updateThemeMode(event.themeMode);

    result.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
        ));
      },
      (_) {
        // Update local state
        if (state.preferences != null) {
          emit(state.copyWith(
            preferences: AppPreferencesEntity(
              themeMode: event.themeMode,
              locale: state.preferences!.locale,
              currencyFormat: state.preferences!.currencyFormat,
            ),
            errorMessage: null,
          ));
        }
      },
    );
  }

  Future<void> _onUpdateLocale(
    UpdateLocale event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await repository.updateLocale(event.locale);

    result.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
        ));
      },
      (_) {
        // Update local state
        if (state.preferences != null) {
          emit(state.copyWith(
            preferences: AppPreferencesEntity(
              themeMode: state.preferences!.themeMode,
              locale: event.locale,
              currencyFormat: state.preferences!.currencyFormat,
            ),
            errorMessage: null,
          ));
        }
      },
    );
  }

  Future<void> _onUpdateCurrencyFormat(
    UpdateCurrencyFormat event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await repository.updateCurrencyFormat(event.currencyFormat);

    result.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
        ));
      },
      (_) {
        // Update local state
        if (state.preferences != null) {
          emit(state.copyWith(
            preferences: AppPreferencesEntity(
              themeMode: state.preferences!.themeMode,
              locale: state.preferences!.locale,
              currencyFormat: event.currencyFormat,
            ),
            errorMessage: null,
          ));
        }
      },
    );
  }

  void _onResetSettings(
    ResetSettings event,
    Emitter<SettingsState> emit,
  ) {
    emit(SettingsState.initial());
  }
}
