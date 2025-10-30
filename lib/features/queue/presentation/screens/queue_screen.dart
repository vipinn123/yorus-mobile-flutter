// lib/features/queue/presentation/screens/queue_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/features/queue/presentation/view_models/queue_view_model.dart';

class QueueScreen extends ConsumerWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queue = ref.watch(queueViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Queue')),
      body: ListView.builder(
        itemCount: queue.length,
        itemBuilder: (context, index) {
          final item = queue[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
          );
        },
      ),
    );
  }
}
