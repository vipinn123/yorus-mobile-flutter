// test/features/onboarding/presentation/screens/onboarding_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/rating_overlay.dart';

void main() {
  testWidgets('OnboardingScreen displays correctly and handles swipe', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    // Verify that the title is displayed.
    expect(find.text('Do you like this?'), findsOneWidget);

    // Verify that the progress bar is displayed.
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // Verify that the CardSwiper is displayed.
    expect(find.byType(CardSwiper), findsOneWidget);

    // Verify that the first card is displayed.
    expect(find.text('Movie 1'), findsOneWidget);

    // Check initial progress
    expect(tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator)).value, 1 / 5);

    // Simulate a swipe.
    await tester.drag(find.byType(CardSwiper), const Offset(-500, 0));
    await tester.pumpAndSettle();

    // Verify that the first card is gone.
    expect(find.text('Movie 1'), findsNothing);

    // Verify that the second card is now visible.
    expect(find.text('Book 2'), findsOneWidget);

    // Check updated progress
    expect(tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator)).value, 2 / 5);
  });

  testWidgets('OnboardingScreen shows rating overlay on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    // Verify that the rating overlay is not visible initially.
    expect(find.byType(RatingOverlay), findsNothing);

    // Tap the first card.
    await tester.tap(find.text('Movie 1'));
    await tester.pump();

    // Verify that the rating overlay is now visible.
    expect(find.byType(RatingOverlay), findsOneWidget);

    // Tap the 'liked' button.
    await tester.tap(find.byIcon(Icons.thumb_up));
    await tester.pumpAndSettle();

    // Verify that the overlay is gone.
    expect(find.byType(RatingOverlay), findsNothing);

    // Verify that the first card is gone.
    expect(find.text('Movie 1'), findsNothing);

    // Verify that the second card is now visible.
    expect(find.text('Book 2'), findsOneWidget);
  });

  testWidgets('OnboardingScreen skip button navigates', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: GoRouter(
          routes: [
            GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
            GoRoute(path: '/home', builder: (context, state) => const Scaffold(body: Text('Home Screen'))),
          ],
        ),
      ),
    );

    // Verify that the skip button is displayed.
    expect(find.text('Skip'), findsOneWidget);

    // Tap the skip button.
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    // Verify that we have navigated to the home screen.
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
