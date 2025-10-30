// lib/features/settings/presentation/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/core/providers.dart';
import 'package:yorus_mobile/core/theme/theme_view_model.dart';
import 'package:yorus_mobile/services/google_sign_in_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeViewModel = ref.watch(themeViewModelProvider.notifier);
    final themeMode = ref.watch(themeViewModelProvider);
    final user = ref.watch(firebaseAuthProvider).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Calibrate Your Vibe'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Logged in as'),
            subtitle: Text(user?.email ?? 'N/A'),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: themeMode == ThemeMode.dark,
            onChanged: (value) => themeViewModel.toggleTheme(),
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () => ref.read(googleSignInServiceProvider).signOutGoogle(),
          ),
          const Divider(),
          ListTile(
            title: const Text('Send Feedback'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Report a Problem'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Terms of Service'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),
          const Divider(),
          const ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
