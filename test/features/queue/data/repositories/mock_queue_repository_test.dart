// test/features/queue/data/repositories/mock_queue_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/queue/data/repositories/mock_queue_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

void main() {
  test('MockQueueRepository adds and gets items from the queue', () async {
    final repository = MockQueueRepository();
    final item = const MediaItem(
      id: '1',
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      imageUrl: 'https://via.placeholder.com/150',
      mediaType: MediaType.movie,
      whyYoullLikeIt: 'Because it is a test.',
    );

    await repository.addToQueue(item);
    final queue = await repository.getQueue();

    expect(queue, isA<List<MediaItem>>());
    expect(queue.length, 1);
    expect(queue.first.title, 'Test Title');
  });
}
