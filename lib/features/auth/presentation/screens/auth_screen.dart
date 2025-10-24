// lib/features/auth/presentation/screens/auth_screen.dart
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yorus - Sign In')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Yorus!', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Google Sign-In with Firebase (next steps)
                print('Sign In button pressed');
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