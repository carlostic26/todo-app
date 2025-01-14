import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* // Enum para representar los modos de tema
enum AppThemeMode { light, dark, system }

// Notificador para manejar el estado del tema
class ThemeNotifier extends StateNotifier<AppThemeMode> {
  ThemeNotifier() : super(AppThemeMode.system);

  // Cambiar el modo de tema
  void setThemeMode(AppThemeMode mode) {
    state = mode;
  }
}

// Proveedor para acceder al estado del tema
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppThemeMode>((ref) {
  return ThemeNotifier();
});
 */

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false); // false = light theme, true = dark theme

  void toggleTheme() {
    state = !state;
  }
}
