// lib/core/routing/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/features/auth/presentation/screens/auth_screen.dart';
import 'package:yorus_mobile/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:yorus_mobile/features/home/presentation/screens/home_screen.dart';
import 'package:yorus_mobile/features/queue/presentation/screens/queue_screen.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/queue',
      builder: (context, state) => const QueueScreen(),
    ),
  ],
);
