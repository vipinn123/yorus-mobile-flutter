// lib/core/theme/theme_view_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeViewModelProvider = StateNotifierProvider<ThemeViewModel, ThemeMode>((ref) {
  return ThemeViewModel();
});

class ThemeViewModel extends StateNotifier<ThemeMode> {
  ThemeViewModel() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
