// test/features/home/presentation/widgets/home_action_buttons_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/home_action_buttons.dart';

void main() {
  testWidgets('HomeActionButtons displays buttons and handles taps', (WidgetTester tester) async {
    bool addToQueueTapped = false;
    bool seenItTapped = false;
    bool notForMeTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeActionButtons(
            onAddToQueue: () => addToQueueTapped = true,
            onSeenIt: () => seenItTapped = true,
            onNotForMe: () => notForMeTapped = true,
          ),
        ),
      ),
    );

    // Verify that all buttons are displayed.
    expect(find.text('+ Add to Queue'), findsOneWidget);
    expect(find.text('I\'ve Seen It'), findsOneWidget);
    expect(find.text('Not for me'), findsOneWidget);

    // Simulate taps and verify callbacks.
    await tester.tap(find.text('+ Add to Queue'));
    await tester.pump();
    expect(addToQueueTapped, isTrue);

    await tester.tap(find.text('I\'ve Seen It'));
    await tester.pump();
    expect(seenItTapped, isTrue);

    await tester.tap(find.text('Not for me'));
    await tester.pump();
    expect(notForMeTapped, isTrue);
  });
}