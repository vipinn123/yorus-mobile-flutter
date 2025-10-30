// test/features/queue/presentation/screens/queue_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/queue/presentation/screens/queue_screen.dart';
import 'package:yorus_mobile/features/queue/presentation/view_models/queue_view_model.dart';

void main() {
  testWidgets('QueueScreen displays items from the queue', (WidgetTester tester) async {
    final items = [
      const MediaItem(
        id: '1',
        title: 'Test Title 1',
        subtitle: 'Test Subtitle 1',
        imageUrl: 'https://via.placeholder.com/150',
        mediaType: MediaType.movie,
        whyYoullLikeIt: 'Because it is a test.',
      ),
      const MediaItem(
        id: '2',
        title: 'Test Title 2',
        subtitle: 'Test Subtitle 2',
        imageUrl: 'https://via.placeholder.com/150',
        mediaType: MediaType.movie,
        whyYoullLikeIt: 'Because it is a test.',
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          queueViewModelProvider.overrideWith((ref) => QueueViewModel(ref.read(queueRepositoryProvider))..state = items),
        ],
        child: const MaterialApp(
          home: QueueScreen(),
        ),
      ),
    );

    expect(find.text('Test Title 1'), findsOneWidget);
    expect(find.text('Test Title 2'), findsOneWidget);
  });
}
