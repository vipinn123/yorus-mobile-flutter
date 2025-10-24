// lib/core/theme/yorus_theme.dart
import 'package:flutter/material.dart';

class YorusTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6200EE), // Example primary color
    hintColor: const Color(0xFF03DAC5),   // Example accent color
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
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
      buttonColor: Color(0xFF6200EE),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    // Add more theme properties based on your design system
    // e.g., inputDecorationTheme, cardTheme, etc.
  );
}