// lib/features/done/presentation/screens/done_screen.dart
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Library')),
      body: const Center(
        child: Text('Done Screen'),
      ),
    );
  }
}
