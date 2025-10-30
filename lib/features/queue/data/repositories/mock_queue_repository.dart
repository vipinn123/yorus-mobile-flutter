// lib/features/queue/data/repositories/mock_queue_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/queue/domain/repositories/queue_repository.dart';

class MockQueueRepository implements QueueRepository {
  final List<MediaItem> _queue = [];

  @override
  Future<void> addToQueue(MediaItem item) async {
    _queue.add(item);
  }

  @override
  Future<List<MediaItem>> getQueue() async {
    return _queue;
  }
}
