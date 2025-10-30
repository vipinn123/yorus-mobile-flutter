// lib/features/auth/presentation/screens/auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            SvgPicture.asset('assets/icons/logo.svg', height: 100, width: 100),
            const SizedBox(height: 40),
            Text('Welcome to Yorus!', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: SvgPicture.asset('assets/icons/icon_google.svg', height: 24, width: 24),
              label: const Text('Sign in with Google'),
              onPressed: () async {
                final user = await ref.read(googleSignInServiceProvider).signInWithGoogle();
                if (user != null) {
                  context.go('/');
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: SvgPicture.asset('assets/icons/icon_apple.svg', height: 24, width: 24),
              label: const Text('Sign in with Apple'),
              onPressed: () {
                // TODO: Implement Apple Sign-In with Firebase (next steps)
                print('Sign in with Apple button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}