// lib/features/search/data/repositories/mock_search_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/search/domain/repositories/search_repository.dart';

class MockSearchRepository implements SearchRepository {
  @override
  Future<List<MediaItem>> search(String query) async {
    // In a real app, this would make a network request.
    // For now, we'll return a hardcoded list.
    if (query.isEmpty) {
      return [];
    }
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
    ];
  }
}
