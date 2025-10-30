// test/features/queue/presentation/view_models/queue_view_model_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/queue/data/repositories/mock_queue_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/queue/domain/repositories/queue_repository.dart';
import 'package:yorus_mobile/features/queue/presentation/view_models/queue_view_model.dart';

void main() {
  test('QueueViewModel adds item to queue and updates state', () async {
    final container = ProviderContainer(
      overrides: [
        queueRepositoryProvider.overrideWithValue(MockQueueRepository()),
      ],
    );

    final viewModel = container.read(queueViewModelProvider.notifier);
    final item = const MediaItem(
      id: '1',
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      imageUrl: 'https://via.placeholder.com/150',
      mediaType: MediaType.movie,
      whyYoullLikeIt: 'Because it is a test.',
    );

    await viewModel.addToQueue(item);

    final state = container.read(queueViewModelProvider);

    expect(state.length, 1);
    expect(state.first.title, 'Test Title');
  });
}
