// lib/features/onboarding/presentation/widgets/media_card.dart
import 'package:flutter/material.dart';

class MediaCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const MediaCard({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
