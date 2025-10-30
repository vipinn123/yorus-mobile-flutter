// lib/features/queue/presentation/widgets/media_list_item.dart
import 'package:flutter/material.dart';
import 'package:yorus_mobile/core/widgets/network_image_with_placeholder.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

class MediaListItem extends StatelessWidget {
  final MediaItem item;

  const MediaListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 56,
        height: 56,
        child: NetworkImageWithPlaceholder(imageUrl: item.imageUrl, fit: BoxFit.cover),
      ),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
    );
  }
}
