import 'package:flutter/material.dart';

class ThemeManager {
  static const Color _seedColor = Colors.blue;

  // Tema Claro
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme().apply(bodyColor: Colors.black),
  );

  // Tema Oscuro
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme().apply(bodyColor: Colors.white),
    dialogBackgroundColor: Colors.grey[900],
  );
}
