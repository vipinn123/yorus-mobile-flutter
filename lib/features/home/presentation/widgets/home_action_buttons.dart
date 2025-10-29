// lib/features/home/presentation/widgets/home_action_buttons.dart
import 'package:flutter/material.dart';

class HomeActionButtons extends StatelessWidget {
  final VoidCallback onAddToQueue;
  final VoidCallback onSeenIt;
  final VoidCallback onNotForMe;

  const HomeActionButtons({
    super.key,
    required this.onAddToQueue,
    required this.onSeenIt,
    required this.onNotForMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onNotForMe,
          child: const Text('Not for me'),
        ),
        ElevatedButton(
          onPressed: onSeenIt,
          child: const Text('I\'ve Seen It'),
        ),
        ElevatedButton(
          onPressed: onAddToQueue,
          child: const Text('+ Add to Queue'),
        ),
      ],
    );
  }
}
