// lib/features/home/presentation/widgets/recommendation_card.dart
import 'package:flutter/material.dart';
import 'package:yorus_mobile/core/widgets/network_image_with_placeholder.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

class RecommendationCard extends StatelessWidget {
  final MediaItem item;

  const RecommendationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NetworkImageWithPlaceholder(
              imageUrl: item.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  Text(item.subtitle, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(item.whyYoullLikeIt, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}