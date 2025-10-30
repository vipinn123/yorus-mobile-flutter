// lib/core/theme/yorus_theme.dart
import 'package:flutter/material.dart';

class YorusTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6366F1), // primary-brand
    hintColor: const Color(0xFF818CF8),      // primary-light
    scaffoldBackgroundColor: const Color(0xFFF1F5F9), // background-primary (light mode)
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF6366F1),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF6366F1), // primary-brand
    hintColor: const Color(0xFF818CF8),      // primary-light
    scaffoldBackgroundColor: const Color(0xFF0F172A), // background-primary (dark mode)
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E293B), // background-secondary
      foregroundColor: Color(0xFFF1F5F9),   // text-primary
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFFF1F5F9)),
      bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFFCBD5E1)), // text-secondary
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF6366F1),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );
}