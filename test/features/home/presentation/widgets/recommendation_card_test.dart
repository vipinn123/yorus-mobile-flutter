// test/features/home/presentation/widgets/recommendation_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/recommendation_card.dart';

void main() {
  testWidgets('RecommendationCard displays media item information', (WidgetTester tester) async {
    final item = const MediaItem(
      id: '1',
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      imageUrl: 'https://via.placeholder.com/150', // Placeholder image
      mediaType: MediaType.movie,
      whyYoullLikeIt: 'Because it is a test.',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecommendationCard(item: item),
        ),
      ),
    );

    // We are only testing for the text elements because testing network images
    // in a widget test is complex and requires mocking HTTP clients.
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Subtitle'), findsOneWidget);
    expect(find.text('Because it is a test.'), findsOneWidget);
  });
}