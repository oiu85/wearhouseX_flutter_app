import 'package:flutter/material.dart';
import '../storage/app_storage_service.dart';

/// Global theme manager using ChangeNotifier for reactive theme changes
/// This manager ensures theme changes propagate throughout the entire app
class ThemeManager extends ChangeNotifier {
  final AppStorageService _storageService;
  ThemeMode _themeMode = ThemeMode.system;
  bool _isInitialized = false;

  ThemeManager(this._storageService) {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;
  bool get isInitialized => _isInitialized;

  Future<void> _loadThemeMode() async {
    final savedThemeMode = await _storageService.getThemeMode();
    if (savedThemeMode != null) {
      _themeMode = savedThemeMode;
    }
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    
    _themeMode = mode;
    await _storageService.saveThemeMode(mode);
    
    // Notify all listeners to rebuild with new theme
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final newMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newMode);
  }
}

