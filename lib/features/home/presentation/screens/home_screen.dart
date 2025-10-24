// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yorus Home')),
      body: Center(
        child: Text(
          'Welcome to Yorus!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}