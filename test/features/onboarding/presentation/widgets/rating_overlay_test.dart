// test/features/onboarding/presentation/widgets/rating_overlay_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/rating_overlay.dart';

void main() {
  testWidgets('RatingOverlay displays buttons and handles taps', (WidgetTester tester) async {
    Rating? selectedRating;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RatingOverlay(
            onRatingSelected: (rating) {
              selectedRating = rating;
            },
          ),
        ),
      ),
    );

    // Verify that the three rating buttons are displayed.
    expect(find.byIcon(Icons.thumb_down), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Simulate a tap on the 'disliked' button.
    await tester.tap(find.byIcon(Icons.thumb_down));
    await tester.pump();
    expect(selectedRating, Rating.disliked);

    // Simulate a tap on the 'liked' button.
    await tester.tap(find.byIcon(Icons.thumb_up));
    await tester.pump();
    expect(selectedRating, Rating.liked);

    // Simulate a tap on the 'loved' button.
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    expect(selectedRating, Rating.loved);
  });
}
