// lib/features/queue/presentation/view_models/queue_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/queue/domain/repositories/queue_repository.dart';
import 'package:yorus_mobile/features/queue/data/repositories/mock_queue_repository.dart';

final queueRepositoryProvider = Provider<QueueRepository>((ref) => MockQueueRepository());

class QueueViewModel extends StateNotifier<List<MediaItem>> {
  final QueueRepository _repository;

  QueueViewModel(this._repository) : super([]);

  Future<void> getQueue() async {
    state = await _repository.getQueue();
  }

  Future<void> addToQueue(MediaItem item) async {
    await _repository.addToQueue(item);
    await getQueue();
  }

  void removeFromQueue(MediaItem item) {
    final currentQueue = List<MediaItem>.from(state);
    currentQueue.remove(item);
    state = currentQueue;
  }
}

final queueViewModelProvider = StateNotifierProvider<QueueViewModel, List<MediaItem>>((ref) {
  final repository = ref.watch(queueRepositoryProvider);
  return QueueViewModel(repository);
});
