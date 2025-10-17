import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2196F3),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8F9FA),
      foregroundColor: Color(0xFF1A1A1A),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFF1A1A1A),
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.2,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF1A1A1A),
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.8,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF4A4A4A),
        fontSize: 18,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF6A6A6A),
        fontSize: 16,
        height: 1.5,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2196F3),
      brightness: Brightness.light,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF00D4FF),
    scaffoldBackgroundColor: const Color(0xFF0A0A0A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0A0A0A),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.2,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.8,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFB0B0B0),
        fontSize: 18,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF808080),
        fontSize: 16,
        height: 1.5,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00D4FF),
      brightness: Brightness.dark,
    ),
  );
}