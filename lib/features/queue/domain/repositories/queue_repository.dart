// lib/features/queue/domain/repositories/queue_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';

abstract class QueueRepository {
  Future<void> addToQueue(MediaItem item);
  Future<List<MediaItem>> getQueue();
}
