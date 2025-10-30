// test/features/done/presentation/view_models/done_view_model_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/done/data/repositories/mock_done_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/done/domain/repositories/done_repository.dart';
import 'package:yorus_mobile/features/done/presentation/view_models/done_view_model.dart';

void main() {
  test('DoneViewModel adds item and updates state', () async {
    final container = ProviderContainer(
      overrides: [
        doneRepositoryProvider.overrideWithValue(MockDoneRepository()),
      ],
    );

    final viewModel = container.read(doneViewModelProvider.notifier);
    final item = const MediaItem(
      id: '1',
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      imageUrl: 'https://via.placeholder.com/150',
      mediaType: MediaType.movie,
      whyYoullLikeIt: 'Because it is a test.',
    );

    await viewModel.addToDone(item);

    final state = container.read(doneViewModelProvider);

    expect(state.length, 1);
    expect(state.first.title, 'Test Title');
  });
}
