// lib/features/onboarding/presentation/widgets/rating_overlay.dart
import 'package:flutter/material.dart';

enum Rating { disliked, liked, loved }

class RatingOverlay extends StatelessWidget {
  final Function(Rating) onRatingSelected;

  const RatingOverlay({super.key, required this.onRatingSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_down, color: Colors.white, size: 40),
              onPressed: () => onRatingSelected(Rating.disliked),
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
              onPressed: () => onRatingSelected(Rating.liked),
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white, size: 40),
              onPressed: () => onRatingSelected(Rating.loved),
            ),
          ],
        ),
      ),
    );
  }
}
