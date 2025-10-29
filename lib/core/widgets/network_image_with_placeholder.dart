// lib/core/widgets/network_image_with_placeholder.dart
import 'package:flutter/material.dart';

class NetworkImageWithPlaceholder extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const NetworkImageWithPlaceholder({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
