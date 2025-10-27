// lib/features/auth/presentation/screens/auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/services/google_sign_in_service.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yorus - Sign In')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Yorus!', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print("Sign-in process started");
                final user = await ref.read(googleSignInServiceProvider).signInWithGoogle();
                print("User object: $user");
                if (user != null) {
                  print("Navigating to onboarding screen");
                  context.go('/onboarding');
                  print("Navigation command issued");
                } else {
                  print("Sign-in failed, user is null");
                }
              },
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Apple Sign-In with Firebase (next steps)
                print('Sign in with Apple button pressed');
              },
              child: const Text('Sign in with Apple'),
            ),
          ],
        ),
      ),
    );
  }
}