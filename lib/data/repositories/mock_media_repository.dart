// lib/data/repositories/mock_media_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/domain/repositories/media_repository.dart';

class MockMediaRepository implements MediaRepository {
  @override
  Future<List<MediaItem>> getRecommendations() async {
    return [
      const MediaItem(
        id: '1',
        mediaType: MediaType.movie,
        title: 'Echoes of the Void',
        subtitle: '2025 • Sci-Fi/Thriller • 1h 55m',
        whyYoullLikeIt: "A mind-bending thriller that feels like 'Black Mirror' meets 'Arrival'. You'll be thinking about the ending for weeks.",
        imageUrl: "https://picsum.photos/seed/echoesvoid/300/400",
      ),
      const MediaItem(
        id: '101',
        mediaType: MediaType.book,
        title: 'The Sundered Sky',
        subtitle: "Elara Vance • 2024 • Fantasy",
        whyYoullLikeIt: "For fans of 'Name of the Wind'. A rich, complex world and a magic system that actually feels new.",
        imageUrl: "https://picsum.photos/seed/sunderedsky/300/400",
      ),
      const MediaItem(
        id: '201',
        mediaType: MediaType.music,
        title: 'Midnight Frequencies',
        subtitle: "The Static Age • 2025 • Album",
        whyYoullLikeIt: "Perfect for a late-night drive. If you like the 'Lo-fi beats' vibe but with a cinematic, synth-wave twist, this is for you.",
        imageUrl: "https://picsum.photos/seed/midnightfreq/300/300",
      ),
    ];
  }
}
