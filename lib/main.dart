// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yorus_mobile/core/routing/app_router.dart';
import 'package:yorus_mobile/core/theme/theme_view_model.dart';
import 'firebase_options.dart';
import 'core/theme/yorus_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: YorusApp()));
}

class YorusApp extends ConsumerWidget {
  const YorusApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeViewModelProvider);

    return MaterialApp.router(
      title: 'Yorus',
      theme: YorusTheme.lightTheme,
      darkTheme: YorusTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}