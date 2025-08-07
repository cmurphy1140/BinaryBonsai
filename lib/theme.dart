import 'package:flutter/material.dart';

class ZenTheme {
  ZenTheme._();

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF2E7D32),
    brightness: Brightness.light,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF66BB6A),
    brightness: Brightness.dark,
  );

  static ThemeData get lightTheme => ThemeData(
        colorScheme: _lightColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: _lightColorScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: _lightColorScheme.primary,
          foregroundColor: _lightColorScheme.onPrimary,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: _darkColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: _darkColorScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: _darkColorScheme.surface,
          foregroundColor: _darkColorScheme.onSurface,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14),
        ),
      );
}
