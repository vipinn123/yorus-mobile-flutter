// test/features/done/presentation/widgets/done_grid_item_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/done/presentation/widgets/done_grid_item.dart';

void main() {
  testWidgets('DoneGridItem displays correctly', (WidgetTester tester) async {
    final item = const MediaItem(
      id: '1',
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      imageUrl: 'https://via.placeholder.com/150',
      mediaType: MediaType.movie,
      whyYoullLikeIt: 'Because it is a test.',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DoneGridItem(item: item),
        ),
      ),
    );

    // A simple test to ensure the widget builds without crashing.
    expect(find.byType(DoneGridItem), findsOneWidget);
  });
}
