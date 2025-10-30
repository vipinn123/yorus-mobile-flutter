// test/features/done/data/repositories/mock_done_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/done/data/repositories/mock_done_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

void main() {
  test('MockDoneRepository adds and gets items', () async {
    final repository = MockDoneRepository();
    final item = const MediaItem(
      id: '1',
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      imageUrl: 'https://via.placeholder.com/150',
      mediaType: MediaType.movie,
      whyYoullLikeIt: 'Because it is a test.',
    );

    await repository.addToDone(item);
    final doneItems = await repository.getDoneItems();

    expect(doneItems, isA<List<MediaItem>>());
    expect(doneItems.length, 1);
    expect(doneItems.first.title, 'Test Title');
  });
}
