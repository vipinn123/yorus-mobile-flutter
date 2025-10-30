// lib/features/done/presentation/widgets/done_grid_item.dart
import 'package:flutter/material.dart';
import 'package:yorus_mobile/core/widgets/network_image_with_placeholder.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

class DoneGridItem extends StatelessWidget {
  final MediaItem item;

  const DoneGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: NetworkImageWithPlaceholder(imageUrl: item.imageUrl, fit: BoxFit.cover),
    );
  }
}
