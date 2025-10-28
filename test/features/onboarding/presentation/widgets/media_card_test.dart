// test/features/onboarding/presentation/widgets/media_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/media_card.dart';

void main() {
  testWidgets('MediaCard displays title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MediaCard(title: 'Test Title'),
        ),
      ),
    );

    // Verify that our card displays the title.
    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('MediaCard onTap callback is called', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediaCard(
            title: 'Test Title',
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(MediaCard));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
