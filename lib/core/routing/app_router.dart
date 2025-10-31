// lib/core/routing/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/core/providers.dart';
import 'package:yorus_mobile/core/widgets/main_scaffold.dart';
import 'package:yorus_mobile/features/auth/presentation/screens/auth_screen.dart';
import 'package:yorus_mobile/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:yorus_mobile/features/home/presentation/screens/home_screen.dart';
import 'package:yorus_mobile/features/queue/presentation/screens/queue_screen.dart';
import 'package:yorus_mobile/features/done/presentation/screens/done_screen.dart';
import 'package:yorus_mobile/features/settings/presentation/screens/settings_screen.dart';
import 'package:yorus_mobile/features/search/presentation/screens/search_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final user = authState.asData?.value;
      final loggingIn = state.matchedLocation == '/login';

      if (user == null) {
        return loggingIn ? null : '/login';
      }

      if (loggingIn) {
        final isNewUser = user.metadata.creationTime == user.metadata.lastSignInTime;
        return isNewUser ? '/onboarding' : '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: '/', builder: (context, state) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/queue', builder: (context, state) => const QueueScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/done', builder: (context, state) => const DoneScreen())],
          ),
        ],
      ),
    ],
  );
});
